part of 'get_rental_partie_project_bloc.dart';

@freezed
class GetRentalPartieProjectState with _$GetRentalPartieProjectState {
  const factory GetRentalPartieProjectState(
      {required RequestState state,
      required String message,
      required RentalModel? rental,
      required List<Data> renalParties,
      required int partieIndex,
      required int productIndex}) = _GetRentalPartieProjectState;
  factory GetRentalPartieProjectState.initial() =>
      const GetRentalPartieProjectState(
          state: RequestState.empty,
          message: '',
          rental: null,
          renalParties: [],
          partieIndex: 0,
          productIndex: 0);
}
