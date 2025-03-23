// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'payment_out_drop_down_bloc.dart';

@immutable
sealed class PaymentOutDropDownEvent {}

class FetchProjectsEvent extends PaymentOutDropDownEvent {}

class AgencyTypeChangeEvent extends PaymentOutDropDownEvent {
  final PartyType partyType;
  AgencyTypeChangeEvent({required this.partyType});
}

class FetchBuildingsEvent extends PaymentOutDropDownEvent {
  final String projectId;

  FetchBuildingsEvent(this.projectId);
}

class FetchAgenciesEvent2 extends PaymentOutDropDownEvent {
  final String buildingId;
  final String projectId;
  FetchAgenciesEvent2(this.buildingId, this.projectId);
}

class AgencyValueChanged extends PaymentOutDropDownEvent {
  final String agencyId;
  AgencyValueChanged({required this.agencyId});
}

class AddPaymentOutTransaction extends PaymentOutDropDownEvent {
  final String amount;
  final String description;
  AddPaymentOutTransaction({
    required this.amount,
    required this.description,
  });
}
