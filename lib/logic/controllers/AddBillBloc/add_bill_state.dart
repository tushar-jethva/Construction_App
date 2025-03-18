// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_bill_bloc.dart';

class AddBillState {
  final List<AgencyModel> selecteParty;
  final bool isLoadingParties;
  final String partyValue;
  final DateTime date;
  final int isAddedBill;
  final List<BillItemModel> billItems;
  final double cgst;
  final double sgst;
  final double tds;
  final String deliveryNote;
  final String modeOfPayment;
  final String referenceNo;
  final String otherReferences;
  final String buyersOrderNo;
  final String dispatchDocNo;
  final String dispatchedThrough;
  final String destination;
  final RequestState state;
  final OtherDetailsBillModel? otherDetailsMode;

  AddBillState(
      {this.selecteParty = const [],
      required this.date,
      this.isAddedBill = 0,
      this.partyValue = '',
      this.isLoadingParties = false,
      this.billItems = const [],
      this.cgst = 9,
      this.sgst = 9,
      this.tds = 2,
      this.state = RequestState.empty,
      this.deliveryNote = "",
      this.modeOfPayment = "",
      this.referenceNo = "",
      this.otherReferences = "",
      this.buyersOrderNo = "",
      this.dispatchedThrough = "",
      this.dispatchDocNo = "",
      this.destination = "",
      this.otherDetailsMode});

  AddBillState copyWith({
    List<AgencyModel>? selecteParty,
    bool? isLoadingParties,
    String? partyValue,
    DateTime? date,
    int? isAddedBill,
    List<BillItemModel>? billItems,
    double? cgst,
    double? sgst,
    double? tds,
    String? deliveryNote,
    String? modeOfPayment,
    String? referenceNo,
    String? otherReferences,
    String? buyersOrderNo,
    String? dispatchDocNo,
    String? dispatchedThrough,
    String? destination,
    RequestState? state,
    OtherDetailsBillModel? otherDetailsMode,
  }) {
    return AddBillState(
      selecteParty: selecteParty ?? this.selecteParty,
      isLoadingParties: isLoadingParties ?? this.isLoadingParties,
      partyValue: partyValue ?? this.partyValue,
      date: date ?? this.date,
      isAddedBill: isAddedBill ?? this.isAddedBill,
      billItems: billItems ?? this.billItems,
      cgst: cgst ?? this.cgst,
      sgst: sgst ?? this.sgst,
      tds: tds ?? this.tds,
      deliveryNote: deliveryNote ?? this.deliveryNote,
      modeOfPayment: modeOfPayment ?? this.modeOfPayment,
      referenceNo: referenceNo ?? this.referenceNo,
      otherReferences: otherReferences ?? this.otherReferences,
      buyersOrderNo: buyersOrderNo ?? this.buyersOrderNo,
      dispatchDocNo: dispatchDocNo ?? this.dispatchDocNo,
      dispatchedThrough: dispatchedThrough ?? this.dispatchedThrough,
      destination: destination ?? this.destination,
      state: state ?? this.state,
      otherDetailsMode: otherDetailsMode ?? this.otherDetailsMode,
    );
  }
}
