part of 'transaction_building_bloc.dart';

@immutable
sealed class TransactionBuildingEvent {}

class FetchAllTransactionByProjectId extends TransactionBuildingEvent {
  final String projectId;

  FetchAllTransactionByProjectId({required this.projectId});
}

class FetchTransactionByQuery extends TransactionBuildingEvent{
  final String query;

  FetchTransactionByQuery({required this.query});
}

class FetchTransactionsByDates extends TransactionBuildingEvent{
  final DateTime startDate;
  final DateTime endDate;

  FetchTransactionsByDates({required this.startDate, required this.endDate});
}

class ResetAll extends TransactionBuildingEvent{
}
