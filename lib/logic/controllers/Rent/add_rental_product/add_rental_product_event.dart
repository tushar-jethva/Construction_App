part of 'add_rental_product_bloc.dart';

@freezed
class AddRentalProductEvent with _$AddRentalProductEvent {
  //Initialize
  const factory AddRentalProductEvent.initialize() = _Initialize;

  const factory AddRentalProductEvent.onUnitChanged({required String unit}) =
      _OnUnitChanged;

  const factory AddRentalProductEvent.onDateChanged({required String date}) =
      _onDateChanged;

  const factory AddRentalProductEvent.onRentalPartyIdChanged(
      {required String rentalPartyId}) = _OnRentalPartyIdChanged;

  //Add Rental

  const factory AddRentalProductEvent.onAddRental(
      {required String projectId,
      required String materialName,
      required String quantity,
      required String description,
      required bool isUpdate,
      required String pricePerUnit,
      String? rentalPartyId,
      required String rentalProductId}) = _OnAddRental;

  //Get material list
  const factory AddRentalProductEvent.fetchAllRental(
      {required String projectId}) = _FetchAllRental;
}
