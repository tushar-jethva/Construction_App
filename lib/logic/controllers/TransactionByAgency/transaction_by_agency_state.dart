part of 'transaction_by_agency_bloc.dart';

@immutable
sealed class TransactionByAgencyState {}

final class TransactionByAgencyInitial extends TransactionByAgencyState {}

final class TransactionByAgencySuccess extends TransactionByAgencyState {
  final List<TransactionModel> listOfTransactionsAgency;
  get projects => listOfTransactionsAgency;
  TransactionByAgencySuccess({required this.listOfTransactionsAgency});
}

final class TransactionByAgencyFailure extends TransactionByAgencyState {}
