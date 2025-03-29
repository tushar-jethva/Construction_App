part of 'rental_by_partie_id_bloc.dart';

@freezed
class RentalByPartieIdState with _$RentalByPartieIdState {
  const factory RentalByPartieIdState({
    required RequestState state,
    required String message,
    required List<GetRentalModel> listOfRentals,
  }) = _RentalByPartieIdState;
  factory RentalByPartieIdState.initial() => const RentalByPartieIdState(
      state: RequestState.empty, message: '', listOfRentals: []);
}
