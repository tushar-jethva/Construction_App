// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'transactions_individual_agency_bloc.dart';

@immutable
sealed class TransactionsIndividualAgencyEvent {}

class FetchIndividualTransactionsOfAgency
    extends TransactionsIndividualAgencyEvent {
  final String agencyId;
  final String projectId;
  FetchIndividualTransactionsOfAgency({
    required this.agencyId,
    required this.projectId,
  });
}

class FetchTransactionByQueryIndividual
    extends TransactionsIndividualAgencyEvent {
  final String query;
  FetchTransactionByQueryIndividual({required this.query});
}

class FetchTransactionsByDatesIndividual
    extends TransactionsIndividualAgencyEvent {
  final DateTime startDate;
  final DateTime endDate;

  FetchTransactionsByDatesIndividual(
      {required this.startDate, required this.endDate});
}

class ResetAllIndividualDate extends TransactionsIndividualAgencyEvent {}
