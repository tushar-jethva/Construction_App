import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/billing_party_repository.dart';
import 'package:construction_mate/data/repository/bills_repository.dart';
import 'package:construction_mate/logic/controllers/OtherDetailsBillBloc/other_details_bill_bloc.dart';
import 'package:construction_mate/logic/models/Other_Details_Bill_Model.dart';
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
    on<BillDeliveryNoteChanged>((event, emit) {
      emit(state.copyWith(deliveryNote: event.value));
    });
    on<BillModeOfPaymentChanged>((event, emit) {
      emit(state.copyWith(modeOfPayment: event.value));
    });
    on<BillreferenceNoChanged>((event, emit) {
      emit(state.copyWith(referenceNo: event.value));
    });
    on<BillOtherReferencesChanged>((event, emit) {
      emit(state.copyWith(otherReferences: event.value));
    });
    on<BillBuyersOrderNoChanged>((event, emit) {
      emit(state.copyWith(buyersOrderNo: event.value));
    });
    on<BillDispatchDocNoChanged>((event, emit) {
      emit(state.copyWith(dispatchDocNo: event.value));
    });
    on<BillDispatchedThroughChanged>((event, emit) {
      emit(state.copyWith(dispatchedThrough: event.value));
    });
    on<BillDestinationChanged>((event, emit) {
      emit(state.copyWith(destination: event.value));
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
        print("-----------------------enter");
        emit(state.copyWith(isAddedBill: 1));
        OtherDetailsBillModel model = OtherDetailsBillModel(
            deliveryNote: state.deliveryNote,
            modeOfPayment: state.modeOfPayment,
            referenceNo: state.referenceNo,
            otherReferences: state.otherReferences,
            buyersOrderNo: state.buyersOrderNo,
            dispatchDocNo: state.dispatchDocNo,
            dispatchedThrough: state.dispatchedThrough,
            destination: state.destination);
        emit(state.copyWith(otherDetailsMode: model));
        print(
            "-------------------------- ${state.otherDetailsMode!.deliveryNote} --------------------------------");
        billsRepository.addBill(
            model: state.otherDetailsMode!,
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
