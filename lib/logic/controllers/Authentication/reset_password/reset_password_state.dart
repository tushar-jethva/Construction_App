part of 'reset_password_bloc.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    required RequestState state,
    required String message,
    required String passoword,
    required String confPassword,
  }) = _ResetPasswordState;
  factory ResetPasswordState.initial() => const ResetPasswordState(
      state: RequestState.empty, message: '', passoword: '', confPassword: '');
}
