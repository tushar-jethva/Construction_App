part of 'other_expense_bloc.dart';

@freezed
class OtherExpenseState with _$OtherExpenseState {
  factory OtherExpenseState({
    required RequestState state,
    required String message,
    required num total,
    required int startYear,
    required int endYear,
    required String? year,
    required OtherExpenseModel? response,
    required List<OthersTransactionDataModel> listOfExpenses,
  }) = _OtherExpenseState;

  factory OtherExpenseState.initial() => OtherExpenseState(
      state: RequestState.empty,
      message: '',
      response: null,
      year: null,
      listOfExpenses: [],
      startYear: DateTime.now().year,
      endYear: DateTime.now().year,
      total: 0);
}
