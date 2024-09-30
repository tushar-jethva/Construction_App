import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class OtherDetailsBillModel {
  final String deliveryNote;
  final String modeOfPayment;
  final String referenceNo;
  final String otherReferences;
  final String buyersOrderNo;
  final String dispatchDocNo;
  final String dispatchedThrough;
  final String destination;
  OtherDetailsBillModel({
    required this.deliveryNote,
    required this.modeOfPayment,
    required this.referenceNo,
    required this.otherReferences,
    required this.buyersOrderNo,
    required this.dispatchDocNo,
    required this.dispatchedThrough,
    required this.destination,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'deliveryNote': deliveryNote,
      'modeOfPayment': modeOfPayment,
      'referenceNo': referenceNo,
      'otherReferences': otherReferences,
      'buyersOrderNo': buyersOrderNo,
      'dispatchDocNo': dispatchDocNo,
      'dispatchedThrough': dispatchedThrough,
      'destination': destination,
    };
  }

  factory OtherDetailsBillModel.fromMap(Map<String, dynamic> map) {
    return OtherDetailsBillModel(
      deliveryNote: map['deliveryNote'] as String,
      modeOfPayment: map['modeOfPayment'] as String,
      referenceNo: map['referenceNo'] as String,
      otherReferences: map['otherReferences'] as String,
      buyersOrderNo: map['buyersOrderNo'] as String,
      dispatchDocNo: map['dispatchDocNo'] as String,
      dispatchedThrough: map['dispatchedThrough'] as String,
      destination: map['destination'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OtherDetailsBillModel.fromJson(String source) =>
      OtherDetailsBillModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
