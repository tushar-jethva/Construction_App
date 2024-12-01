part of 'add_billing_party_bloc.dart';

@immutable
sealed class AddBillingPartyEvent {}

class LoadProjectsBillingEvent extends AddBillingPartyEvent {}

class BillingProjectValueChanged extends AddBillingPartyEvent {
  final String projectValue;
  BillingProjectValueChanged({required this.projectValue});
}

class AddBillingParty extends AddBillingPartyEvent {
  final String partyName;
  final String email;
  final String gstNo;
  final String contactNo;
  final String shippingAddress;
  final String billingAddress;

  AddBillingParty(
      {required this.partyName,
      required this.email,
      required this.gstNo,
      required this.contactNo,
      required this.shippingAddress,
      required this.billingAddress});
}

class Initialize extends AddBillingPartyEvent{
  
}
