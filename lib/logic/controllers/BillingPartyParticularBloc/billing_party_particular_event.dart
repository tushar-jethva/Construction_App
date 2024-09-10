part of 'billing_party_particular_bloc.dart';

@immutable
sealed class BillingPartyParticularEvent {}

class BillingPartyParticularLoadBills extends BillingPartyParticularEvent{
  final String partyId;
  BillingPartyParticularLoadBills({required this.partyId});
}
