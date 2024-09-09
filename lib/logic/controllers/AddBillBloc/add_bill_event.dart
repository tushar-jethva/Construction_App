part of 'add_bill_bloc.dart';

@immutable
sealed class AddBillEvent {}

class BillItemAddedEvent extends AddBillEvent{
  BillItemModel billItem;
  BillItemAddedEvent({required this.billItem});
}

class BillSGSTChangedEvent extends AddBillEvent{
  final double sgst;
  BillSGSTChangedEvent({required this.sgst});
}

class BillCGSTChangedEvent extends AddBillEvent{
  final double cgst;
  BillCGSTChangedEvent({required this.cgst});
}

class BillTDSChangedEvent extends AddBillEvent{
  final double tds;
  BillTDSChangedEvent({required this.tds});
}

class BillDateChangedEvent extends AddBillEvent{
  final DateTime dateTime;
  BillDateChangedEvent({
    required this.dateTime
  });
}
