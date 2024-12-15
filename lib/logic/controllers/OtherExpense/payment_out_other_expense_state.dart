part of 'payment_out_other_expense_bloc.dart';

@freezed
class PaymentOutOtherExpenseState with _$PaymentOutOtherExpenseState {
  const factory PaymentOutOtherExpenseState(
      {required RequestState state,
      required String message,
      required EntryType entryType,
      required Transaction transactionType,
      required String description,
      required String amount}) = _PaymentOutOtherExpenseState;

  factory PaymentOutOtherExpenseState.initial() => PaymentOutOtherExpenseState(
      state: RequestState.empty,
      message: '',
      entryType: EntryType.Debit,
      transactionType: Transaction.payGST,
      description: "",
      amount: "");
}
