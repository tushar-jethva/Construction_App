part of 'add_rent_supplier_bloc.dart';

@freezed
class AddRentSupplierState with _$AddRentSupplierState {
  const factory AddRentSupplierState({
    required RequestState state,
    required String message,
    required String partyName,
    required String gstNo,
    required String email,
    required String contactNo,
    required String address,
  }) = _AddRentSupplierState;
  factory AddRentSupplierState.initial() => const AddRentSupplierState(
        state: RequestState.empty,
        message: '',
        partyName: '',
        gstNo: '',
        email: '',
        contactNo: '',
        address: '',
      );
}
