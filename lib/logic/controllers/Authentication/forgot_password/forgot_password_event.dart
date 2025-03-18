part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  //Initialize
  const factory ForgotPasswordEvent.started() = _Started;

  //Email
  const factory ForgotPasswordEvent.onEmailChanged({required String email}) =
      _OnEmailChanged;

  //Verify email
  const factory ForgotPasswordEvent.verifyEmail() = _VerifyEmail;

  //Send otp
  const factory ForgotPasswordEvent.sendForgotPasswordOtp() =
      _SendForgotPasswordOtp;
}
