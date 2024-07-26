part of 'agency_works_projects_bloc.dart';

@immutable
sealed class AgencyWorksProjectsState {}

final class AgencyWorksProjectsInitial extends AgencyWorksProjectsState {}

final class AgencyWorksProjectsSuccess extends AgencyWorksProjectsState {
  final List<TotalAgencyModel> totalAgencies;
  AgencyWorksProjectsSuccess({required this.totalAgencies});
}

final class AgencyWorksProjectsFailure extends AgencyWorksProjectsState {}
