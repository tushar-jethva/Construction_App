part of 'agency_works_projects_bloc.dart';

@immutable
sealed class AgencyWorksProjectsEvent {}

class LoadTotalProjectAgencies extends AgencyWorksProjectsEvent{
  final String projectId;
  LoadTotalProjectAgencies({required this.projectId});
}

class FetchTransactionByQueryProjectAgency extends AgencyWorksProjectsEvent{
  final String query;

  FetchTransactionByQueryProjectAgency({required this.query});
}
