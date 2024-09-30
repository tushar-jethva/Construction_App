part of 'other_details_bill_bloc.dart';

@freezed
class OtherDetailsBillEvent with _$OtherDetailsBillEvent {
  const factory OtherDetailsBillEvent.onDeliveryNoteChanged(
      final String value) = _OnDeliveryNoteChnaged;

  const factory OtherDetailsBillEvent.onModeOfPaymentChnaged(
      final String value) = _OnModeOfPaymentChnaged;

  const factory OtherDetailsBillEvent.onReferenceNoChanged(final String value) =
      _OnReferenceNoChanged;
  const factory OtherDetailsBillEvent.onOtherReferencesChanged(
      final String value) = _OnOtherReferencesChanged;
  const factory OtherDetailsBillEvent.onBuyersOrderNoChanged(
      final String value) = _OnBuyersOrderNoChanged;
  const factory OtherDetailsBillEvent.onDispatchedDocNoChanged(
      final String value) = _OnDispatchedDocNoChanged;
  const factory OtherDetailsBillEvent.onDispatchedThroughChanged(
      final String value) = _OnDispatchedThroughChanged;
  const factory OtherDetailsBillEvent.onDestinationChanged(final String value) =
      _OnDestinationChanged;

  const factory OtherDetailsBillEvent.getOtherModel() = _GetOtherModel;
}
