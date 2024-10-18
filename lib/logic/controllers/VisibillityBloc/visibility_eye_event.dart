part of 'visibility_eye_bloc.dart';

@freezed
class VisibilityEyeEvent with _$VisibilityEyeEvent {
  const factory VisibilityEyeEvent.isPasswordShowChanged() = _IsPasswordShowChanged;
  const factory VisibilityEyeEvent.isConfirmPasswordShowChanged() = _IsConfirmPasswordShowChanged;
}
