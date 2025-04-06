part of 'get_rental_partie_project_bloc.dart';

@freezed
class GetRentalPartieProjectEvent with _$GetRentalPartieProjectEvent {
  //Initialize
  const factory GetRentalPartieProjectEvent.initialize() = _Initialize;

  //Search query change
  const factory GetRentalPartieProjectEvent.onSearchQueryChanged(
      {required String searchQuery}) = _OnSearchQueryChanged;

  // partie index changes
  const factory GetRentalPartieProjectEvent.onPartieIndexChanged(
      {required int index}) = _OnPartieIndexChanged;

  //product index changes
  const factory GetRentalPartieProjectEvent.onProductIndexChanged(
      {required int index}) = _OnProductIndexChanged;

  //fetch rental parties
  const factory GetRentalPartieProjectEvent.fetchRentalParties(
      {required String projectId}) = _FetchRentalParties;
}
