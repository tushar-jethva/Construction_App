part of 'payment_in_drop_down_bloc.dart';

@immutable
sealed class PaymentInDropDownEvent {}
class FetchProjectsInEvent extends PaymentInDropDownEvent {}
class FetchAgencyInEvent extends PaymentInDropDownEvent {}

class AgencyValueInChanged extends PaymentInDropDownEvent{
  final String agencyId;
  AgencyValueInChanged({required this.agencyId});
}

class ProjectValueInChanged extends PaymentInDropDownEvent{
  final String projectId;
  ProjectValueInChanged({required this.projectId});
}

class AddPaymentInTransaction extends PaymentInDropDownEvent {
 final String amount;
 final String description;
  AddPaymentInTransaction({
    required this.amount,
    required this.description,
  });


}
