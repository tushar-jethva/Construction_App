part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.initial() = _initials;

  // TextField events
  const factory SignUpEvent.emailOnChanged(String email) = _EmailOnChanged;
  const factory SignUpEvent.companyNameChanged(String companyName) =
      _CompanyNameChanged;
  const factory SignUpEvent.passwordChanged(String password) =
      _PasswordOnChanged;
  const factory SignUpEvent.confPasswordChanged(String confPassword) =
      _ConfirmPasswordOnChanged;
  const factory SignUpEvent.otpOnChanged(String otp) = _OtpOnChanged;

  const factory SignUpEvent.checkIsEmailExist() = _CheckIsEmailExist;

  const factory SignUpEvent.verifyOtp() = _VerifyOTP;

  const factory SignUpEvent.addUser() = _AddUser;

  const factory SignUpEvent.signIn() = _SignInUserAfterSignUp;

  const factory SignUpEvent.setScreenState() = _SetScreenState;

}
