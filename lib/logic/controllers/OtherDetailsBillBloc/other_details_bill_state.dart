part of 'other_details_bill_bloc.dart';

@freezed
class OtherDetailsBillState with _$OtherDetailsBillState {
  const factory OtherDetailsBillState({
    required String deliveryNote,
    required String modeOfPayment,
    required String referenceNo,
    required String otherReferences,
    required String buyersOrderNo,
    required String dispatchDocNo,
    required String dispatchedThrough,
    required String destination,
    required RequestState state,
    required OtherDetailsBillModel otherDetailsMode,
  }) = _OtherDetailsBillState;

  factory OtherDetailsBillState.initial() => OtherDetailsBillState(
      state: RequestState.empty,
      deliveryNote: "",
      modeOfPayment: "",
      referenceNo: "",
      otherReferences: "",
      buyersOrderNo: "",
      dispatchedThrough: "",
      dispatchDocNo: "",
      destination: "",
      otherDetailsMode: OtherDetailsBillModel(
          deliveryNote: "",
          modeOfPayment: "",
          referenceNo: "",
          otherReferences: "",
          buyersOrderNo: "",
          dispatchDocNo: "",
          dispatchedThrough: "",
          destination: ""));
}
