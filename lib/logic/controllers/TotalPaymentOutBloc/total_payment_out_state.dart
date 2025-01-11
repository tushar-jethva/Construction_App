// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'total_payment_out_bloc.dart';

@freezed
class TotalPaymentOutState with _$TotalPaymentOutState {
  const factory TotalPaymentOutState(
      {required RequestState state,
      required String message,
      required String paymentOut,
      required String paymentIn}) = _TotalPaymentOutState;

  factory TotalPaymentOutState.initial() => TotalPaymentOutState(
      state: RequestState.empty, message: '', paymentIn: "0", paymentOut: "0");
}
