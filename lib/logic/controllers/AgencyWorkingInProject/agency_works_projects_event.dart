part of 'agency_works_projects_bloc.dart';

@freezed
sealed class AgencyWorksProjectsEvent with _$AgencyWorksProjectsEvent {
  //Initiali
  const factory AgencyWorksProjectsEvent.initialize() = _Initalize;

  //on query changed
  const factory AgencyWorksProjectsEvent.onQueryChanged(
      {required String query}) = _OnQueryChanged;

  //Fetch agencies
  const factory AgencyWorksProjectsEvent.fetchAgencies({required String projectId}) = _FetchAgencies;
}

// class LoadTotalProjectAgencies extends AgencyWorksProjectsEvent {
//   final String projectId;
//   LoadTotalProjectAgencies({required this.projectId});
// }

// class FetchTransactionByQueryProjectAgency extends AgencyWorksProjectsEvent {
//   final String query;

//   FetchTransactionByQueryProjectAgency({required this.query});
// }
