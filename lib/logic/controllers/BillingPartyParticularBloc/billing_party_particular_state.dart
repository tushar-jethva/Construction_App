part of 'billing_party_particular_bloc.dart';

@immutable
sealed class BillingPartyParticularState {}

final class BillingPartyParticularLoading extends BillingPartyParticularState {}
final class BillingPartyParticularLoaded extends BillingPartyParticularState {
  final List<BillModel> bills;
  BillingPartyParticularLoaded({required this.bills});
}

final class BillingPartyParticularFailure extends BillingPartyParticularState {}

