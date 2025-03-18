part of 'verify_otp_bloc.dart';

@freezed
class VerifyOtpState with _$VerifyOtpState {
  const factory VerifyOtpState(
      {required RequestState state,
      required String message,
      required String otp}) = _VerifyOtpState;
  factory VerifyOtpState.initial() =>
      const VerifyOtpState(state: RequestState.empty, message: '', otp: '');
}
