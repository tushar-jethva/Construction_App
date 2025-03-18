part of 'add_rental_product_bloc.dart';

@freezed
class AddRentalProductState with _$AddRentalProductState {
  const factory AddRentalProductState({
    required RequestState state,
    required String message,
    required String unit,
    required String date,
    required List<RentalModel> rentalList,
    required String rentalPartyId,
  }) = _AddRentalProductState;
  factory AddRentalProductState.initial() => AddRentalProductState(
      state: RequestState.empty,
      message: '',
      unit: '',
      date: DateTime.now().toString(),
      rentalPartyId: '',
      rentalList: []);
}
