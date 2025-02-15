part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState(
      {required RequestState state,
      required RequestState state1,
      required RequestState state2,
      required RequestState state3,
      required bool isDialogOpen,
      required int screenState,
      required String message,
      required String companyName,
      required String email,
      required String password,
      required String confirmPassword,
      required String otp,
      required bool isVerified}) = _SignUpFormState;

  factory SignUpState.initial() => const SignUpState(
      state: RequestState.empty,
      state1: RequestState.empty,
      state2: RequestState.empty,
      state3: RequestState.empty,
      isDialogOpen: false,
      screenState: -1,
      message: '',
      email: '',
      companyName: "",
      password: "",
      confirmPassword: "",
      otp: "",
      isVerified: false);
}
