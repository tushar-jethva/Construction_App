part of 'payment_out_other_material_and_rent_bloc.dart';

@freezed
class PaymentOutOtherMaterialAndRentEvent
    with _$PaymentOutOtherMaterialAndRentEvent {
  const factory PaymentOutOtherMaterialAndRentEvent.started() = _Started;

  //add other transaction material and rent
  const factory PaymentOutOtherMaterialAndRentEvent.addOtherMaterialAndRent({
    required String amount,
    required String description,
    required String projectId,
    required String partieId,
    required PartyType partyType
  }) = _addOtherMaterialAndRent;
  
}
