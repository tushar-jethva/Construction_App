part of 'get_rental_products_bloc.dart';

@freezed
class GetRentalProductsState with _$GetRentalProductsState {
  const factory GetRentalProductsState(
      {required RequestState state,
      required String message,
      required List<GetRentalModel> rentalProducts}) = _GetRentalProductsState;
  factory GetRentalProductsState.initial() => const GetRentalProductsState(
      state: RequestState.empty, message: '', rentalProducts: []);
}
