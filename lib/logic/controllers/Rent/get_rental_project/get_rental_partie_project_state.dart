part of 'get_rental_partie_project_bloc.dart';

@freezed
class GetRentalPartieProjectState with _$GetRentalPartieProjectState {
  const factory GetRentalPartieProjectState(
          {required RequestState state,
          required String message,
          required List<ProjectPartieModel> rentalParties}) =
      _GetRentalPartieProjectState;
  factory GetRentalPartieProjectState.initial() =>
      const GetRentalPartieProjectState(
          state: RequestState.empty, message: '', rentalParties: []);
}
