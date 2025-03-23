part of 'payment_out_other_material_and_rent_bloc.dart';

@freezed
class PaymentOutOtherMaterialAndRentState
    with _$PaymentOutOtherMaterialAndRentState {
  const factory PaymentOutOtherMaterialAndRentState({
    required RequestState state,
    required String message,
  }) = _PaymentOutOtherMaterialAndRentState;
  factory PaymentOutOtherMaterialAndRentState.initial() =>
      const PaymentOutOtherMaterialAndRentState(
          state: RequestState.empty, message: '');
}
