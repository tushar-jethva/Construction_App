part of 'transaction_by_agency_bloc.dart';

@immutable
sealed class TransactionByAgencyEvent {}

class FetchAllTransactionByAgencyId extends TransactionByAgencyEvent {
  final String agencyId;

  FetchAllTransactionByAgencyId({required this.agencyId});
}

class FetchTransactionByQueryParties extends TransactionByAgencyEvent{
  final String query;
  FetchTransactionByQueryParties({required this.query});
}

class FetchTransactionsByDatesParties extends TransactionByAgencyEvent{
  final DateTime startDate;
  final DateTime endDate;

  FetchTransactionsByDatesParties({required this.startDate, required this.endDate});
}

class ResetAllPartiesDate extends TransactionByAgencyEvent{
}
