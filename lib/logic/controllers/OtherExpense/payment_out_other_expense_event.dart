part of 'payment_out_other_expense_bloc.dart';

@freezed
class PaymentOutOtherExpenseEvent with _$PaymentOutOtherExpenseEvent {
  factory PaymentOutOtherExpenseEvent.getOtherExpenseValue(
      {required String value}) = _GetOtherExpenseValue;

  factory PaymentOutOtherExpenseEvent.addPaymentOUt(
      {required String paymentOut}) = _AddPaymentOut;
}
