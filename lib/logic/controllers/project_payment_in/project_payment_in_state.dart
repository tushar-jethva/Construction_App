part of 'project_payment_in_bloc.dart';

@freezed
class ProjectPaymentInState with _$ProjectPaymentInState {
  const factory ProjectPaymentInState({
    required RequestState state,
    required RequestState agencyState,
    required String message,
    required String agencyDropDownValue,
    required String paymentIn,
    required String description,
  required List<AgencyModel> agencies

  }) = _ProjectPaymentInState;
  factory ProjectPaymentInState.initial() => const ProjectPaymentInState(
      state: RequestState.empty,
      agencyState: RequestState.empty,
      agencyDropDownValue: '',
      message: '',
      paymentIn: 'paymentIn',
      description: 'description',
      agencies: []);
}
