import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/data/usecases/profile_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';
part 'edit_profile_bloc.freezed.dart';

@singleton
class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileBloc(this.profileUsecase) : super(EditProfileState.initial()) {
    on<EditProfileEvent>(
      (event, emit) async {
        await event.map(
          initialize: (_Initialize value) {
            emit(EditProfileState.initial());
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
                imageUrl: state.imageUrl);

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
}
