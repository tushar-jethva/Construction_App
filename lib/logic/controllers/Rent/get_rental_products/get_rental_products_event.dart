part of 'get_rental_products_bloc.dart';

@freezed
class GetRentalProductsEvent with _$GetRentalProductsEvent {
  //Initialize
  const factory GetRentalProductsEvent.initialize() = _Initialize;

  //fetch products
  const factory GetRentalProductsEvent.fetchAllRentalProducts(
      {required String projectId}) = _FetchAllRentalProducts;
}
