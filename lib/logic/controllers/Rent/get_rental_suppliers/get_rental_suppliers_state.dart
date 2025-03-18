part of 'get_rental_suppliers_bloc.dart';

@freezed
class GetRentalSuppliersState with _$GetRentalSuppliersState {
  const factory GetRentalSuppliersState({
    required RequestState state,
    required String message,
    required List<AgencyModel> listOfRentalAgencies,
    required String selectedRentalAgency,
  }) = _GetRentalSuppliersState;
  factory GetRentalSuppliersState.initial() => const GetRentalSuppliersState(
      state: RequestState.empty,
      message: '',
      listOfRentalAgencies: [],
      selectedRentalAgency: '');
}
