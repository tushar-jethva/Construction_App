import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/data/usecases/profile_usecase.dart';
import 'package:construction_mate/logic/controllers/Profile/user-watcher/user_watcher_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';
part 'edit_profile_bloc.freezed.dart';

@singleton
class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(this.profileUsecase, this.userWatcherBloc)
      : super(EditProfileState.initial()) {
    on<EditProfileEvent>(
      (event, emit) async {
        await event.map(
          initialize: (_Initialize value) {
            emit(EditProfileState.initial());
          },
          setData: (value) {
            final user = userWatcherBloc.state.profile;
            emit(state.copyWith(
                state: RequestState.empty,
                email: user?.email ?? '',
                gst: user?.gSTNumber ?? '',
                mobileNo: user?.mobile.toString() ?? '',
                imageUrl: user?.logo ?? ''));
          },
          onEmailChanged: (_OnEmailChanged value) {
            emit(state.copyWith(state: RequestState.empty, email: value.email));
          },
          onNumberChanged: (_OnNumberChanged value) {
            emit(state.copyWith(
                state: RequestState.empty, mobileNo: value.phoneNumber));
          },
          onImageUrlChanged: (_OnImageUrlChanged value) {
            emit(state.copyWith(
                state: RequestState.empty, imageUrl: value.imageUrl));
          },
          onGSTChanged: (_OnGSTChanged value) {
            emit(state.copyWith(state: RequestState.empty, gst: value.gstNo));
          },
          onImageChanged: (_OnImageChanged value) {
            emit(state.copyWith(state: RequestState.empty, image: value.image));
          },
          onUpdateProfileTap: (_OnUpdateProfileTap value) async {
            emit(state.copyWith(state: RequestState.loading));
            final url = await ReusableFunctions.uploadToCloudinary(
                state.image ?? XFile(""));

            final res = await profileUsecase.completeProfile(
                email: state.email,
                gst: state.gst,
                phoneNumber: state.mobileNo,
                imageUrl: url.isEmpty
                    ? (userWatcherBloc.state.profile?.logo ?? "")
                    : url);

            res.fold((l) {
              emit(state.copyWith(
                  state: RequestState.error, message: l.message));
            }, (r) {
              emit(state.copyWith(state: RequestState.loaded, message: r));
            });
          },
        );
      },
    );
  }

  final ProfileUsecase profileUsecase;
  final UserWatcherBloc userWatcherBloc;
}
