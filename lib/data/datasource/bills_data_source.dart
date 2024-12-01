import 'dart:convert';
import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/Other_Details_Bill_Model.dart';
import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:construction_mate/logic/models/financial_model.dart';
import 'package:construction_mate/logic/models/bill_item_model.dart';
import 'package:construction_mate/utilities/dio_config/base_data_center.dart';

abstract class BillsDataSource {
  Future<void> addBill(
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
  final dio = BaseDataCenter().dio.dio;

  @override
  Future<void> addBill(
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
      final res = await dio.post(
        API.ADD_BILL,
        data: jsonEncode({
          'date': date,
          'Items': billItems.map((e) => e.toJson()).toList(),
          'SGST': sgst,
          'CGST': cgst,
          'TDS': tds,
          'PartieId': partyId,
          'MoreDetails': model.toMap()
        }),
      );

      print(res.data);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<BillModel>> allBiilsByParticularParty(
      {required String partyId}) async {
    List<BillModel> billsList = [];
    try {
      final res = await dio.get(
        "${API.GET_ALL_BILLS_BY_PARTY_ID}/${partyId}",
      );
      final bills = res.data;
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
      final res = await dio.get(API.GET_FINACIALS);

      financialModel = FinancialModel.fromMap(res.data["data"]);
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
      final res = await dio.get("${API.GET_FINACIALS}/$partyId");

      financialModel = FinancialModel.fromMap(res.data["data"]);
      print(financialModel);
    } catch (e) {
      print(e.toString());
    }
    return financialModel;
  }
}
