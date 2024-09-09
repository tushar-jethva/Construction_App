// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_bill_bloc.dart';

class AddBillState {
  final List<BillingPartyModel> selecteParty;
  final bool isLoadingParties;
  final String partyValue;
  final DateTime date;
  final int isAddedBill;
  final List<BillItemModel> billItems;
  final double cgst;
  final double sgst;
  final double tds;

  AddBillState({
    this.selecteParty = const [],
    required this.date,
    this.isAddedBill = 0,
    this.partyValue = '',
    this.isLoadingParties = false,
    this.billItems = const [],
    this.cgst = 9,
    this.sgst = 9,
    this.tds = 2,
  });

  AddBillState copyWith({
    List<BillingPartyModel>? selecteParty,
    DateTime? date,
    List<BillItemModel>? billItems,
    int? isAddedBill,
    String? partyValue,
    bool? isLoadingParties,
    double? cgst,
    double? sgst,
    double? tds,
  }) {
    return AddBillState(
        selecteParty: selecteParty ?? this.selecteParty,
        date: date ?? this.date,
        billItems: billItems ?? this.billItems,
        cgst: cgst ?? this.cgst,
        sgst: sgst ?? this.sgst,
        isAddedBill: isAddedBill ?? this.isAddedBill,
        isLoadingParties: isLoadingParties ?? this.isLoadingParties,
        tds: tds ?? this.tds,
        partyValue: partyValue ?? this.partyValue);
  }
}
