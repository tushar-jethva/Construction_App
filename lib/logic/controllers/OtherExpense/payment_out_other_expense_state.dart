part of 'payment_out_other_expense_bloc.dart';

@freezed
class PaymentOutOtherExpenseState with _$PaymentOutOtherExpenseState {
  const factory PaymentOutOtherExpenseState(
      {required String expenseValue,
      required String paymentOut}) = _PaymentOutOtherExpenseState;

  factory PaymentOutOtherExpenseState.initial() =>
      PaymentOutOtherExpenseState(expenseValue: "", paymentOut: "0");
}
