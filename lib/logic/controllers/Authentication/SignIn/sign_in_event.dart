part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  // TextField events
  const factory SignInEvent.emailOnChanged(String email) = _EmailOnChanged;
  const factory SignInEvent.passwordChanged(String password) =
      _PasswordOnChanged;

  const factory SignInEvent.loginUser() = _LoginUser;

  const factory SignInEvent.logout() = _Logout;
}
