part of 'reset_password_bloc.dart';

@freezed
class ResetPasswordEvent with _$ResetPasswordEvent {
  //Initialize
  const factory ResetPasswordEvent.initialize() = _Initialize;

  //password
  const factory ResetPasswordEvent.onPasswordChanged(
      {required String password}) = _OnPasswordChanged;

  //conf password
  const factory ResetPasswordEvent.onConfPasswordChanged(
      {required String confPassword}) = _OnConfPasswordChanged;

  //reset password
  const factory ResetPasswordEvent.resetPasswordTap() = _ResetPasswordTap;
}
