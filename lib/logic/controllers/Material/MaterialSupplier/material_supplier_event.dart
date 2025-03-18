part of 'material_supplier_bloc.dart';

@freezed
class MaterialSupplierEvent with _$MaterialSupplierEvent {
  const factory MaterialSupplierEvent.started() = _Started;

  // add material supplier
  const factory MaterialSupplierEvent.addMaterialSupplier() =
      _AddMaterialSupplier;

  // party name changed
  const factory MaterialSupplierEvent.partyNameChanged(
      {required String partyName}) = _PartyNameChanged;

  // gst no changed
  const factory MaterialSupplierEvent.gstNoChanged({required String gstNo}) =
      _GstNoChanged;

  // email changed
  const factory MaterialSupplierEvent.emailChanged({required String email}) =
      _EmailChanged;

  // contact no changed
  const factory MaterialSupplierEvent.contactNoChanged(
      {required String contactNo}) = _ContactNoChanged;

  // address changed
  const factory MaterialSupplierEvent.addressChanged(
      {required String address}) = _AddressChanged;
}
