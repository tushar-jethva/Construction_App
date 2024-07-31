// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'total_payment_out_bloc.dart';

class TotalPaymentOutState {
  String paymentOut;
  String paymentIn;
  TotalPaymentOutState({
    this.paymentOut = "0",
    this.paymentIn = "0",
  });

  TotalPaymentOutState copyWith({
    String? paymentOut,
    String? paymentIn,
  }) {
    return TotalPaymentOutState(
      paymentOut: paymentOut ?? this.paymentOut,
      paymentIn: paymentIn ?? this.paymentIn,
    );
  }
}
