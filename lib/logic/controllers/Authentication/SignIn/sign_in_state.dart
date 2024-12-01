part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    required RequestState state,
    required RequestState state1,
    required String message,
    required String email,
    required String password,
  }) = _SignInState;

  factory SignInState.initial() => SignInState(
    state1: RequestState.empty,
      state: RequestState.empty, message: "", email: "", password: "");
}
