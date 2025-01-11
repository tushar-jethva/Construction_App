part of 'payment_total_project_bloc.dart';

@freezed
class PaymentTotalProjectEvent with _$PaymentTotalProjectEvent {
  //Initialize
  const factory PaymentTotalProjectEvent.initialize() = _Initialize;

  //Fetch total payments
  const factory PaymentTotalProjectEvent.fetchAllTotalPayments({required String projectId}) = _FetchAllTotalPayments;

}


