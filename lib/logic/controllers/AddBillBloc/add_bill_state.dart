// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_bill_bloc.dart';

class AddBillState {
  final List<String> selecteParty;
  final DateTime date;
  final List<BillItemModel> billItems;
  final double cgst;
  final double sgst;
  final double tds;

  AddBillState({
    this.selecteParty = const [],
    required this.date,
    this.billItems = const [],
    this.cgst = 9,
    this.sgst = 9,
    this.tds = 2,
  });

  AddBillState copyWith({
    List<String>? selecteParty,
    DateTime? date,
    List<BillItemModel>? billItems,
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
        tds: tds ?? this.tds);
  }
}
