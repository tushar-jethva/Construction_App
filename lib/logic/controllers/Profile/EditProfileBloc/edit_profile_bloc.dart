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
                name: user?.name ?? '',
                email: user?.email ?? '',
                gst: user?.gSTNumber ?? '',
                mobileNo: user?.mobile.toString() ?? '0',
                imageUrl: user?.logo ?? '',
                address: user?.address ?? ''));
          },
          onNameChanged: (_OnNameChanged value) {
            emit(state.copyWith(state: RequestState.empty, name: value.name));
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
          onAddressChanged: (_OnAddressChanged value) {
            emit(state.copyWith(
                state: RequestState.empty, address: value.address));
          },
          onUpdateProfileTap: (_OnUpdateProfileTap value) async {
            emit(state.copyWith(state: RequestState.loading));
            String url = "";
            if (state.image != null) {
              url = await ReusableFunctions.uploadToCloudinary(state.image!);
            }

            final res = await profileUsecase.completeProfile(
                name: state.name,
                email: state.email,
                gst: state.gst,
                phoneNumber: state.mobileNo == '0' ? "0" : state.mobileNo,
                imageUrl: url.isEmpty
                    ? (userWatcherBloc.state.profile?.logo ?? "")
                    : url,
                address: state.address);

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
