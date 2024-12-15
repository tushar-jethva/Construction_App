part of 'payment_out_other_expense_bloc.dart';

@freezed
class PaymentOutOtherExpenseEvent with _$PaymentOutOtherExpenseEvent {
  //Initialize
  factory PaymentOutOtherExpenseEvent.initialize() = _Initialize;

  //amount changed
  factory PaymentOutOtherExpenseEvent.onAmountChanged({required String amount}) =
      _OnAmountChanged;

  //Transaction Type changed
  factory PaymentOutOtherExpenseEvent.onTransactionTypeChanged(
      {required Transaction transationType}) = _OnTransactionTypeChanged;
  

  //Description changed
  factory PaymentOutOtherExpenseEvent.onDescriptionChanged({required String description}) =
      _OnDescriptionChanged;

  //add payment
  factory PaymentOutOtherExpenseEvent.addOtherPaymentOUt() = _AddPaymentOut;
}
