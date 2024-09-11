import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/bills_repository.dart';
import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:meta/meta.dart';

part 'billing_party_particular_event.dart';
part 'billing_party_particular_state.dart';

class BillingPartyParticularBloc
    extends Bloc<BillingPartyParticularEvent, BillingPartyParticularState> {
  final BillsRepository billsRepository;
  BillingPartyParticularBloc({required this.billsRepository})
      : super(BillingPartyParticularLoading()) {
    on<BillingPartyParticularLoadBills>((event, emit) async {
      try {
        emit(BillingPartyParticularLoading());
        List<BillModel> bills = await billsRepository.allBiilsByParticularParty(
            partyId: event.partyId);
        emit(BillingPartyParticularLoaded(bills: bills));
      } catch (e) {
        emit(BillingPartyParticularFailure());
      }
    });
  }
}
