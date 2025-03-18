import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/billing_party_repository.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'payment_in_drop_down_event.dart';
part 'payment_in_drop_down_state.dart';

class PaymentInDropDownBloc
    extends Bloc<PaymentInDropDownEvent, PaymentInDropDownState> {
  final AgencyRepository agencyRepository;
  final TransactionRepository transactionRepository;
  PaymentInDropDownBloc(
      {required this.agencyRepository, required this.transactionRepository})
      : super(PaymentInDropDownState(date: DateTime.now())) {
    on<FetchAgencyInEvent>((event, emit) async {
      emit(AgenciesLoadingInState(
          agencyDropDownValue: state.agencyDropDownValue,
          agencies: state.agencies,
          date: state.date));
      try {
        final res = await agencyRepository.getTotalAgencies(
            partyType: PartyType.BillingParty);

        res.fold((l) {}, (r) {
          r.insert(0, AgencyModel(name: "--Select Agency--", sId: '0'));
          emit(state.copyWith(agencies: r));
          emit(AgenciesLoadedInState(
              agencyDropDownValue: state.agencyDropDownValue,
              agencies: state.agencies,
              date: state.date));
        });
      } catch (e) {}
    });

    on<AgencyValueInChanged>((event, emit) async {
      emit(state.copyWith(agencyDropDownValue: event.agencyId));
      emit(AgenciesLoadedInState(
          agencyDropDownValue: state.agencyDropDownValue,
          agencies: state.agencies,
          date: state.date));
    });

    on<PaymentInDateChanged>((event, emit) async {
      emit(state.copyWith(
        date: event.date,
      ));
      emit(AgenciesLoadedInState(
          agencyDropDownValue: state.agencyDropDownValue,
          agencies: state.agencies,
          date: state.date));
    });

    on<AddPaymentInTransaction>((event, emit) async {
      try {
        emit(PaymentInAddLoading(
            agencyDropDownValue: state.agencyDropDownValue,
            agencies: state.agencies,
            date: state.date));
        await transactionRepository.addPaymentInTransaction(
            date: state.date.toString(),
            agencyId: state.agencyDropDownValue,
            amount: event.amount);
        emit(PaymentInAddSuccess(
            agencyDropDownValue: state.agencyDropDownValue,
            agencies: state.agencies,
            date: state.date));
      } catch (e) {
        emit(PaymentInAddFailure(
            agencyDropDownValue: state.agencyDropDownValue,
            agencies: state.agencies,
            date: state.date));
      }
    });
  }
}
