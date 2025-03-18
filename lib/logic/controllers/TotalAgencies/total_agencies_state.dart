part of 'total_agencies_bloc.dart';

@immutable
sealed class TotalAgenciesState {}

final class TotalAgenciesInitial extends TotalAgenciesState {}

final class TotalAgenciesLoadSuccess extends TotalAgenciesState {
  final List<AgencyModel> totalAgencies;
  TotalAgenciesLoadSuccess({required this.totalAgencies});
}

final class TotalAgenciesLoadFailure extends TotalAgenciesState {}
