part of 'project_payment_in_bloc.dart';

@freezed
class ProjectPaymentInEvent with _$ProjectPaymentInEvent {
  //Initialize
  const factory ProjectPaymentInEvent.initialize() = _Initialize;

  //Agency dropdown
  const factory ProjectPaymentInEvent.onAgencyDropDownValueChanged(
      {required String agencyDropDownValue}) = _OnAgencyDropDownValueChanged;

  //Fetch agencies
  const factory ProjectPaymentInEvent.fetchAgencies(
      {required String projectId}) = _FetchAgencies;

  //On payment changed
  const factory ProjectPaymentInEvent.onPaymentInChanged(
      {required String payment}) = _OnPaymentInChanged;

  //On description chnaged
  const factory ProjectPaymentInEvent.onDescriptionChanged(
      {required String des}) = _OnDescriptionChanged;

  //Add payment in
  const factory ProjectPaymentInEvent.addPaymentIn() = _AddPaymentIn;
}
