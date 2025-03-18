part of 'add_rent_supplier_bloc.dart';

@freezed
class AddRentSupplierEvent with _$AddRentSupplierEvent {
  const factory AddRentSupplierEvent.started() = _Started;

  // add material supplier
  const factory AddRentSupplierEvent.addRentSupplier() = _AddRentSupplier;

  // party name changed
  const factory AddRentSupplierEvent.partyNameChanged(
      {required String partyName}) = _PartyNameChanged;

  // gst no changed
  const factory AddRentSupplierEvent.gstNoChanged({required String gstNo}) =
      _GstNoChanged;

  // email changed
  const factory AddRentSupplierEvent.emailChanged({required String email}) =
      _EmailChanged;

  // contact no changed
  const factory AddRentSupplierEvent.contactNoChanged(
      {required String contactNo}) = _ContactNoChanged;

  // address changed
  const factory AddRentSupplierEvent.addressChanged({required String address}) =
      _AddressChanged;
}
