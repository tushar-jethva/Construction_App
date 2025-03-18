part of 'get_rental_suppliers_bloc.dart';

@freezed
class GetRentalSuppliersEvent with _$GetRentalSuppliersEvent {
  //Initialize
  const factory GetRentalSuppliersEvent.initialize() = _Initialize;

  //Get rental party
  const factory GetRentalSuppliersEvent.onRentalPartyChanged(
      {required String rentalParty}) = _OnRentalPartyChanged;

  //Fetch rental
  const factory GetRentalSuppliersEvent.fetchRentalSuppliers() =
      _FetchRentalSuppliers;
}
