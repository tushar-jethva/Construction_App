part of 'edit_profile_bloc.dart';

@freezed
class EditProfileState with _$EditProfileState {
  factory EditProfileState(
      {required RequestState state,
      required String message,
      required XFile? image,
      required String imageUrl,
      required String email,
      required String gst,
      required String address,
      required String mobileNo}) = _EditProfileState;

   factory EditProfileState.initial() => EditProfileState(state: RequestState.empty, message: "", imageUrl: "", email: "", gst: "", mobileNo: "",image: null,address: '');
}
