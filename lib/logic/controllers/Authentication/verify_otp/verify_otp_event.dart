part of 'verify_otp_bloc.dart';

@freezed
class VerifyOtpEvent with _$VerifyOtpEvent {
  const factory VerifyOtpEvent.started() = _Started;

  //Otp
  const factory VerifyOtpEvent.onOtpChanged({required String otp}) =
      _OnOtpChanged;

  //verify otp
  const factory VerifyOtpEvent.onVerifyOtp() = _OnVerifyOtp;
}
