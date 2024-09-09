import 'dart:convert';

import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:http/http.dart' as http;
import 'package:construction_mate/logic/models/bill_item_model.dart';

abstract class BillsDataSource {
  void addBill(
      {required String date,
      required List<BillItemModel> billItems,
      required String sgst,
      required String cgst,
      required String tds,
      required String partyId});
}

class BillsDataSourceImpl extends BillsDataSource {
  @override
  void addBill(
      {required String date,
      required List<BillItemModel> billItems,
      required String sgst,
      required String cgst,
      required String tds,
      required String partyId}) async {
    try {
      print(billItems.map((e) => e.toJson()).toList());
      print(billItems[0].toJson());

      print("$date $sgst $cgst $tds $partyId");

      print(jsonEncode({
        'date': date,
        'Items': billItems.map((e) => e.toJson()).toList(),
        'SGST': sgst,
        'CGST': cgst,
        'TDS': tds,
        'PartieId': partyId
      }));
      http.Response res = await http.post(
        Uri.parse(API.ADD_BILL),
        body: jsonEncode({
          'date': date,
          'Items': billItems.map((e) => e.toJson()).toList(),
          'SGST': sgst,
          'CGST': cgst,
          'TDS': tds,
          'PartieId': partyId
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(res.body);
    } catch (e) {
      print(e.toString());
    }
  }
}
