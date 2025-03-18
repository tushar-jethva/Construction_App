part of 'material_supplier_bloc.dart';

@freezed
class MaterialSupplierState with _$MaterialSupplierState {
  const factory MaterialSupplierState({
    required RequestState state,
    required String message,
    required String partyName,
    required String gstNo,
    required String email,
    required String contactNo,
    required String address,
  }) = _MaterialSupplierState;
  factory MaterialSupplierState.initial() => const MaterialSupplierState(
        state: RequestState.empty,
        message: '',
        partyName: '',
        gstNo: '',
        email: '',
        contactNo: '',
        address: '',
      );
}
