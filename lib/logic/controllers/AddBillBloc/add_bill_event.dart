part of 'add_bill_bloc.dart';

class AddBillEvent {}

class BillGetAllPartiesEvent extends AddBillEvent {}

class BillItemAddedEvent extends AddBillEvent {
  BillItemModel billItem;
  BillItemAddedEvent({required this.billItem});
}

class BillSGSTChangedEvent extends AddBillEvent {
  final double sgst;
  BillSGSTChangedEvent({required this.sgst});
}

class BillCGSTChangedEvent extends AddBillEvent {
  final double cgst;
  BillCGSTChangedEvent({required this.cgst});
}

class BillTDSChangedEvent extends AddBillEvent {
  final double tds;
  BillTDSChangedEvent({required this.tds});
}

class BillDateChangedEvent extends AddBillEvent {
  final DateTime dateTime;
  BillDateChangedEvent({required this.dateTime});
}

class BillPartyNameChanged extends AddBillEvent {
  final String partyId;
  BillPartyNameChanged({required this.partyId});
}

class BillDeliveryNoteChanged extends AddBillEvent {
  final String value;
  BillDeliveryNoteChanged({required this.value});
}

class BillModeOfPaymentChanged extends AddBillEvent {
  final String value;
  BillModeOfPaymentChanged({required this.value});
}

class BillreferenceNoChanged extends AddBillEvent {
  final String value;
  BillreferenceNoChanged({required this.value});
}

class BillOtherReferencesChanged extends AddBillEvent {
  final String value;
  BillOtherReferencesChanged({required this.value});
}

class BillBuyersOrderNoChanged extends AddBillEvent {
  final String value;
  BillBuyersOrderNoChanged({required this.value});
}

class BillDispatchDocNoChanged extends AddBillEvent {
  final String value;
  BillDispatchDocNoChanged({required this.value});
}

class BillDispatchedThroughChanged extends AddBillEvent {
  final String value;
  BillDispatchedThroughChanged({required this.value});
}

class BillDestinationChanged extends AddBillEvent {
  final String value;
  BillDestinationChanged({required this.value});
}

class BillAddBillEvent extends AddBillEvent {
  BillAddBillEvent();
}
