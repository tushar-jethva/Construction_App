part of 'add_billing_party_bloc.dart';

@immutable
sealed class AddBillingPartyEvent {}

class LoadProjectsBillingEvent extends AddBillingPartyEvent{}
