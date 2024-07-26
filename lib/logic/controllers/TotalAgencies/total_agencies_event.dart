part of 'total_agencies_bloc.dart';

@immutable
sealed class TotalAgenciesEvent {}

class LoadTotalAgencies extends TotalAgenciesEvent{}


class FetchTransactionByQueryTotalAgency extends TotalAgenciesEvent{
  final String query;

  FetchTransactionByQueryTotalAgency({required this.query});
}

