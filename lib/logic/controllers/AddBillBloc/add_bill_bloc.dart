import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/billing_party_repository.dart';
import 'package:construction_mate/data/repository/bills_repository.dart';
import 'package:construction_mate/logic/models/bill_item_model.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';
import 'package:meta/meta.dart';

part 'add_bill_event.dart';
part 'add_bill_state.dart';

class AddBillBloc extends Bloc<AddBillEvent, AddBillState> {
  final BillingPartyRepository billingPartyRepository;
  final BillsRepository billsRepository;
  AddBillBloc(
      {required this.billingPartyRepository, required this.billsRepository})
      : super(AddBillState(date: DateTime.now())) {
    on<BillItemAddedEvent>((event, emit) {
      List<BillItemModel> listOfBillItems = List.from(state.billItems)
        ..add(event.billItem);
      emit(state.copyWith(billItems: listOfBillItems));
    });

    on<BillSGSTChangedEvent>((event, emit) {
      emit(state.copyWith(sgst: event.sgst));
    });

    on<BillCGSTChangedEvent>((event, emit) {
      emit(state.copyWith(cgst: event.cgst));
    });

    on<BillTDSChangedEvent>((event, emit) {
      emit(state.copyWith(tds: event.tds));
    });
    on<BillDateChangedEvent>((event, emit) {
      emit(state.copyWith(date: event.dateTime));
    });
    on<BillGetAllPartiesEvent>((event, emit) async {
      try {
        emit(state.copyWith(
            isLoadingParties: false, partyValue: state.partyValue));
        List<BillingPartyModel> parties =
            await billingPartyRepository.getAllParties();
        parties.insert(
            0, BillingPartyModel(name: "--Select Party--", sId: "0"));
        emit(state.copyWith(
            selecteParty: parties,
            isLoadingParties: true,
            partyValue: state.partyValue));
      } catch (e) {}
    });
    on<BillPartyNameChanged>((event, emit) {
      emit(state.copyWith(partyValue: event.partyId));
    });

    on<BillAddBillEvent>((event, emit) {
      try {
        emit(state.copyWith(isAddedBill: 1));
        billsRepository.addBill(
            date: state.date.toString(),
            billItems: state.billItems,
            sgst: state.sgst.toString(),
            cgst: state.cgst.toString(),
            tds: state.tds.toString(),
            partyId: state.partyValue);
        emit(state.copyWith(isAddedBill: 2));
      } catch (e) {}
    });
  }
}
