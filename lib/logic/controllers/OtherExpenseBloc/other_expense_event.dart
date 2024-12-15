part of 'other_expense_bloc.dart';

@freezed
class OtherExpenseEvent with _$OtherExpenseEvent {
  //initialize
  const factory OtherExpenseEvent.initialize() = _Initialize;

  //Year
  const factory OtherExpenseEvent.onFilterYearChanged({String? year}) =
      _OnFilterYearChanged;

  //Get tds
  const factory OtherExpenseEvent.fetchOtherExpenses() = _fetchOtherExpenses;
}