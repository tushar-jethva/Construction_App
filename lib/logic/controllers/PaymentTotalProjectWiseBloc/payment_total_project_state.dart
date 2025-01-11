part of 'payment_total_project_bloc.dart';

@freezed
class PaymentTotalProjectState with _$PaymentTotalProjectState {
  const factory PaymentTotalProjectState({
    required RequestState state,
    required String message,
    required String paymentOut,
    required String paymentIn,
  }) = _PaymentTotalProjectState;

  factory PaymentTotalProjectState.initial() => const PaymentTotalProjectState(
      state: RequestState.empty, message: '', paymentOut: "0", paymentIn: "0");
}
