part of 'get_rental_partie_project_bloc.dart';

@freezed
class GetRentalPartieProjectEvent with _$GetRentalPartieProjectEvent {
  //Initialize
  const factory GetRentalPartieProjectEvent.initialize() = _Initialize;

  //fetch rental parties
  const factory GetRentalPartieProjectEvent.fetchRentalParties({required String projectId}) = _FetchRentalParties;
}
