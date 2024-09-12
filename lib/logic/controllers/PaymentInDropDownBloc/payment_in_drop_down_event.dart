part of 'payment_in_drop_down_bloc.dart';

@immutable
sealed class PaymentInDropDownEvent {}

class FetchProjectsInEvent extends PaymentInDropDownEvent {}

class FetchAgencyInEvent extends PaymentInDropDownEvent {}

class AgencyValueInChanged extends PaymentInDropDownEvent {
  final String agencyId;
  AgencyValueInChanged({required this.agencyId});
}

class PaymentInDateChanged extends PaymentInDropDownEvent {
  final DateTime date;
  PaymentInDateChanged({required this.date});
}

class AddPaymentInTransaction extends PaymentInDropDownEvent {
  final String amount;
  AddPaymentInTransaction({required this.amount});
}
