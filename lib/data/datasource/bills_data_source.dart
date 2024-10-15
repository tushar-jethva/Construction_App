import 'dart:convert';
import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/Other_Details_Bill_Model.dart';
import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:construction_mate/logic/models/financial_model.dart';
import 'package:http/http.dart' as http;
import 'package:construction_mate/logic/models/bill_item_model.dart';

abstract class BillsDataSource {
  void addBill(
      {required String date,
      required List<BillItemModel> billItems,
      required String sgst,
      required String cgst,
      required String tds,
      required String partyId,
      required OtherDetailsBillModel model});

  Future<List<BillModel>> allBiilsByParticularParty({required String partyId});

  Future<FinancialModel> getFinancial();
  Future<FinancialModel> getFinancialByPartyId({required String partyId});
}

class BillsDataSourceImpl extends BillsDataSource {
  @override
  void addBill(
      {required String date,
      required List<BillItemModel> billItems,
      required String sgst,
      required String cgst,
      required String tds,
      required String partyId,
      required OtherDetailsBillModel model}) async {
    try {
      final data = jsonEncode({
        'date': date,
        'Items': billItems.map((e) => e.toJson()).toList(),
        'SGST': sgst,
        'CGST': cgst,
        'TDS': tds,
        'PartieId': partyId,
        'MoreDetails': model.toMap()
      });

      print(data);
      http.Response res = await http.post(
        Uri.parse(API.ADD_BILL),
        body: jsonEncode({
          'date': date,
          'Items': billItems.map((e) => e.toJson()).toList(),
          'SGST': sgst,
          'CGST': cgst,
          'TDS': tds,
          'PartieId': partyId,
          'MoreDetails': model.toMap()
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

  @override
  Future<List<BillModel>> allBiilsByParticularParty(
      {required String partyId}) async {
    List<BillModel> billsList = [];
    try {
      http.Response res = await http.get(
          Uri.parse("${API.GET_ALL_BILLS_BY_PARTY_ID}/${partyId}"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      final bills = jsonDecode(res.body);
      for (var bill in bills["data"]) {
        billsList.add(BillModel.fromJson(bill));
      }
    } catch (e) {
      print(e.toString());
    }
    return billsList;
  }

  @override
  Future<FinancialModel> getFinancial() async {
    FinancialModel financialModel = FinancialModel("0", "0", "0", "0");
    try {
      http.Response res = await http
          .get(Uri.parse(API.GET_FINACIALS), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      });

      financialModel = FinancialModel.fromMap(jsonDecode(res.body)["data"]);
      print(financialModel);
    } catch (e) {
      print(e.toString());
    }
    return financialModel;
  }

  @override
  Future<FinancialModel> getFinancialByPartyId(
      {required String partyId}) async {
    FinancialModel financialModel = FinancialModel("0", "0", "0", "0");
    try {
      http.Response res = await http.get(
          Uri.parse("${API.GET_FINACIALS}/$partyId"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      financialModel = FinancialModel.fromMap(jsonDecode(res.body)["data"]);
      print(financialModel);
    } catch (e) {
      print(e.toString());
    }
    return financialModel;
  }
}
