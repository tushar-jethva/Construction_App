part of 'edit_profile_bloc.dart';

@freezed
class EditProfileEvent with _$EditProfileEvent {
  //initialize
  const factory EditProfileEvent.initialize() = _Initialize;

  //set data
  const factory EditProfileEvent.setData() = _SetData;

  //Text Fields
  const factory EditProfileEvent.onNameChanged({required String name}) =
      _OnNameChanged;

  const factory EditProfileEvent.onEmailChanged({required String email}) =
      _OnEmailChanged;

  const factory EditProfileEvent.onNumberChanged(
      {required String phoneNumber}) = _OnNumberChanged;
  const factory EditProfileEvent.onImageUrlChanged({required String imageUrl}) =
      _OnImageUrlChanged;

  const factory EditProfileEvent.onImageChanged({required XFile image}) =
      _OnImageChanged;
  const factory EditProfileEvent.onGSTChanged({required String gstNo}) =
      _OnGSTChanged;

  //address
  const factory EditProfileEvent.onAddressChanged({required String address}) =
      _OnAddressChanged;

  const factory EditProfileEvent.onUpdateProfileTap() = _OnUpdateProfileTap;
}
