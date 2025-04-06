import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/billing_party_repository.dart';
import 'package:construction_mate/data/repository/bills_repository.dart';
import 'package:construction_mate/logic/models/Other_Details_Bill_Model.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/bill_item_model.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';
import 'package:injectable/injectable.dart';
part 'add_bill_event.dart';
part 'add_bill_state.dart';

@singleton
class AddBillBloc extends Bloc<AddBillEvent, AddBillState> {
  final AgencyRepository agencyRepository;
  final BillsRepository billsRepository;
  AddBillBloc({required this.agencyRepository, required this.billsRepository})
      : super(AddBillState(date: DateTime.now())) {
    on<BillItemAddedEvent>((event, emit) {
      List<BillItemModel> listOfBillItems = List.from(state.billItems)
        ..add(event.billItem);
      emit(state.copyWith(billItems: listOfBillItems, isAddedBill: 0));
    });

    on<AddBillInitialize>((event, emit) {
      emit(state.copyWith(
          selecteParty: [],
          isLoadingParties: false,
          partyValue: '',
          date: DateTime.now(),
          isAddedBill: 0,
          billItems: [],
          cgst: 9,
          sgst: 9,
          tds: 2,
          state: RequestState.empty,
          deliveryNote: "",
          modeOfPayment: "",
          referenceNo: "",
          otherReferences: "",
          buyersOrderNo: "",
          dispatchedThrough: "",
          dispatchDocNo: "",
          destination: "",
          otherDetailsMode: OtherDetailsBillModel(
              deliveryNote: "",
              modeOfPayment: "",
              referenceNo: "",
              otherReferences: "",
              buyersOrderNo: "",
              dispatchDocNo: "",
              dispatchedThrough: "",
              destination: "")));
    });

    on<BillSGSTChangedEvent>((event, emit) {
      emit(state.copyWith(sgst: event.sgst, isAddedBill: 0));
    });

    on<BillCGSTChangedEvent>((event, emit) {
      emit(state.copyWith(cgst: event.cgst, isAddedBill: 0));
    });

    on<BillTDSChangedEvent>((event, emit) {
      emit(state.copyWith(tds: event.tds, isAddedBill: 0));
    });
    on<BillDateChangedEvent>((event, emit) {
      emit(state.copyWith(date: event.dateTime, isAddedBill: 0));
    });
    on<BillDeliveryNoteChanged>((event, emit) {
      emit(state.copyWith(deliveryNote: event.value, isAddedBill: 0));
    });
    on<BillModeOfPaymentChanged>((event, emit) {
      emit(state.copyWith(modeOfPayment: event.value, isAddedBill: 0));
    });
    on<BillreferenceNoChanged>((event, emit) {
      emit(state.copyWith(referenceNo: event.value, isAddedBill: 0));
    });
    on<BillOtherReferencesChanged>((event, emit) {
      emit(state.copyWith(otherReferences: event.value, isAddedBill: 0));
    });
    on<BillBuyersOrderNoChanged>((event, emit) {
      emit(state.copyWith(buyersOrderNo: event.value, isAddedBill: 0));
    });
    on<BillDispatchDocNoChanged>((event, emit) {
      emit(state.copyWith(dispatchDocNo: event.value, isAddedBill: 0));
    });
    on<BillDispatchedThroughChanged>((event, emit) {
      emit(state.copyWith(dispatchedThrough: event.value, isAddedBill: 0));
    });
    on<BillDestinationChanged>((event, emit) {
      emit(state.copyWith(destination: event.value, isAddedBill: 0));
    });
    on<BillGetAllPartiesEvent>((event, emit) async {
      try {
        emit(state.copyWith(
            isLoadingParties: false,
            partyValue: state.partyValue,
            isAddedBill: 0));
        final res = await agencyRepository.getTotalAgencies(
            partyType: PartyType.BillingParty);

        res.fold((l) {}, (parties) {
          parties.insert(0, AgencyModel(name: "--Select Party--", sId: "0"));
          emit(state.copyWith(
              selecteParty: parties,
              isLoadingParties: true,
              partyValue: state.partyValue,
              isAddedBill: 0));
        });
      } catch (e) {}
    });
    on<BillPartyNameChanged>((event, emit) {
      emit(state.copyWith(partyValue: event.partyId, isAddedBill: 0));
    });

    on<BillAddBillEvent>((event, emit) async {
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
        final res = await billsRepository.addBill(
            model: state.otherDetailsMode!,
            date: state.date.toString(),
            billItems: state.billItems,
            sgst: state.sgst.toString(),
            cgst: state.cgst.toString(),
            tds: state.tds.toString(),
            partyId: state.partyValue);

        res.fold((l) {
          emit(state.copyWith(isAddedBill: 3));
        }, (r) {
          emit(state.copyWith(isAddedBill: 2));
        });
      } catch (e) {}
    });
  }
}
