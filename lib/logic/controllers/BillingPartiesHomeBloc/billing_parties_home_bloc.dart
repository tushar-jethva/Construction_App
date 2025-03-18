import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/billing_party_repository.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'billing_parties_home_event.dart';
part 'billing_parties_home_state.dart';

class BillingPartiesHomeBloc
    extends Bloc<BillingPartiesHomeEvent, BillingPartiesHomeState> {
  final AgencyRepository agencyRepository;
  BillingPartiesHomeBloc({required this.agencyRepository})
      : super(BillingPartiesHomeLoading()) {
    on<BillingPartiesLoadEvent>((event, emit) async {
      try {
        emit(BillingPartiesHomeLoading());
        final res = await agencyRepository.getTotalAgencies(
            partyType: PartyType.BillingParty);

        res.fold((l) {
          emit(BillingPartiesHomeFailure());
        }, (r) {
          emit(BillingPartiesHomeLoaded(billingParties: r));
        });
      } catch (e) {
        emit(BillingPartiesHomeFailure());
      }
    });
  }
}
