part of 'transactions_individual_agency_bloc.dart';

@immutable
sealed class TransactionsIndividualAgencyState {}

final class TransactionsIndividualAgencyInitial extends TransactionsIndividualAgencyState {}
final class TransactionsIndividualAgencySuccess extends TransactionsIndividualAgencyState {
  final List<TransactionModel> listOfIndividualTransactions;

  TransactionsIndividualAgencySuccess({required this.listOfIndividualTransactions});

}
final class TransactionsIndividualAgencyFailure extends TransactionsIndividualAgencyState {}

