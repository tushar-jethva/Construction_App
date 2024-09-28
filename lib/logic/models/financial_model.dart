// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FinancialModel {
  final String? totalTds;
  final String? totalGst;
  final String? totalReceivedAmount;
  final String? totalReceivableAmount;

  FinancialModel(this.totalTds, this.totalGst, this.totalReceivedAmount,
      this.totalReceivableAmount);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalTds': totalTds,
      'totalGst': totalGst,
      'totalReceivedAmount': totalReceivedAmount,
      'totalReceivableAmount': totalReceivableAmount,
    };
  }

  factory FinancialModel.fromMap(Map<String, dynamic> map) {
    return FinancialModel(
      map['totalTds'] = (map['totalTds'] as dynamic).toString(),
      map['totalGst'] = (map['totalGst'] as dynamic).toString(),
      map['totalReceivedAmount'] =
          (map['totalReceivedAmount'] as dynamic).toString(),
      map['totalReceivableAmount'] =
          (map['totalReceivableAmount'] as dynamic).toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory FinancialModel.fromJson(String source) =>
      FinancialModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
