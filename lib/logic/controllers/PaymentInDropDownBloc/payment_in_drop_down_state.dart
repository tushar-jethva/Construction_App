// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'payment_in_drop_down_bloc.dart';

class PaymentInDropDownState {
  final String agencyDropDownValue;
  final List<BillingPartyModel> agencies;
  final DateTime date;
  PaymentInDropDownState({
    this.agencyDropDownValue = '',
    this.agencies = const [],
    required this.date,
  });

  PaymentInDropDownState copyWith({
    String? agencyDropDownValue,
    List<BillingPartyModel>? agencies,
    DateTime? date
  }) {
    return PaymentInDropDownState(
      agencyDropDownValue: agencyDropDownValue ?? this.agencyDropDownValue,
      agencies: agencies ?? this.agencies,
      date: date ?? this.date
    );
  }
}

class AgenciesLoadingInState extends PaymentInDropDownState {
  AgenciesLoadingInState(
      {required super.agencyDropDownValue, required super.agencies, required super.date});
}

class AgenciesLoadedInState extends PaymentInDropDownState {
  AgenciesLoadedInState(
      {required super.agencyDropDownValue, required super.agencies, required super.date});
}

class PaymentInAddLoading extends PaymentInDropDownState {
  PaymentInAddLoading(
      {required super.agencyDropDownValue, required super.agencies, required super.date});
}

class PaymentInAddSuccess extends PaymentInDropDownState {
  PaymentInAddSuccess(
      {required super.agencyDropDownValue, required super.agencies, required super.date});
}

class PaymentInAddFailure extends PaymentInDropDownState {
  PaymentInAddFailure(
      {required super.agencyDropDownValue, required super.agencies, required super.date});
}
