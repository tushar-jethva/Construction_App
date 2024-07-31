part of 'payment_total_project_bloc.dart';

  class PaymentTotalProjectState {
  String paymentOut;
  String paymentIn;
  PaymentTotalProjectState({
    this.paymentOut = "0",
    this.paymentIn = "0",
  });

  PaymentTotalProjectState copyWith({
    String? paymentOut,
    String? paymentIn,
  }) {
    return PaymentTotalProjectState(
      paymentOut: paymentOut ?? this.paymentOut,
      paymentIn: paymentIn ?? this.paymentIn,
    );
  }
}
