part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState(
      {required ForgotState state,
      required String message,
      required String email}) = _ForgotPasswordState;
  factory ForgotPasswordState.initial() => const ForgotPasswordState(
      state: ForgotState.empty, message: '', email: '');
}
