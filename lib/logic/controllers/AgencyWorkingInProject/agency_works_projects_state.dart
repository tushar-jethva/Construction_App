part of 'agency_works_projects_bloc.dart';

@freezed
class AgencyWorksProjectsState with _$AgencyWorksProjectsState {
  const factory AgencyWorksProjectsState({
    required RequestState state,
    required String message,
    required String query,
    required List<TotalAgencyModel> totalAgencies,
  }) = _AgencyWorksProjectsState;

  factory AgencyWorksProjectsState.initial() => const AgencyWorksProjectsState(
      state: RequestState.empty, message: '', query: '', totalAgencies: []);
}

// final class AgencyWorksProjectsInitial extends AgencyWorksProjectsState {}

// final class AgencyWorksProjectsSuccess extends AgencyWorksProjectsState {
//   final List<TotalAgencyModel> totalAgencies;
//   AgencyWorksProjectsSuccess({required this.totalAgencies});
// }

// final class AgencyWorksProjectsFailure extends AgencyWorksProjectsState {
//   final String message;
//   AgencyWorksProjectsFailure({required this.message});
// }
