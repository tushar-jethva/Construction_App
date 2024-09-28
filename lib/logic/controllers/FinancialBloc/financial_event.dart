part of 'financial_bloc.dart';

@freezed
class FinancialEvent with _$FinancialEvent{
  const factory FinancialEvent.fetchFinancials() =
      _FetchFinancials;
}
