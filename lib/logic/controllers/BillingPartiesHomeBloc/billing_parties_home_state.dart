part of 'billing_parties_home_bloc.dart';

@immutable
sealed class BillingPartiesHomeState {}

final class BillingPartiesHomeLoading extends BillingPartiesHomeState {}

final class BillingPartiesHomeLoaded extends BillingPartiesHomeState {
  final List<BillingPartyModel> billingParties;

  BillingPartiesHomeLoaded({required this.billingParties});
}

final class BillingPartiesHomeFailure extends BillingPartiesHomeState {}
