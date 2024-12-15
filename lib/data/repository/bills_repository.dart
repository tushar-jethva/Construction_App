import 'dart:convert';

import 'package:construction_mate/data/datasource/bills_data_source.dart';
import 'package:construction_mate/logic/models/Other_Details_Bill_Model.dart';
import 'package:construction_mate/logic/models/bill_item_model.dart';
import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:construction_mate/logic/models/financial_model.dart';
import 'package:construction_mate/utilities/error_handling/error_handler.dart';
import 'package:construction_mate/utilities/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class BillsRepository {
  Future<Either<Failure, String>> addBill(
      {required String date,
      required OtherDetailsBillModel model,
      required List<BillItemModel> billItems,
      required String sgst,
      required String cgst,
      required String tds,
      required String partyId});
  Future<List<BillModel>> allBiilsByParticularParty({required String partyId});
  Future<FinancialModel> getFinancial();
  Future<FinancialModel> getFinancialByPartyId({required String partyId});
}

@LazySingleton(as: BillsRepository)
class BillsRepositoryImpl extends BillsRepository {
  final BillsDataSource billsDataSource = BillsDataSourceImpl();
  @override
  Future<Either<Failure, String>> addBill(
      {required String date,
      required List<BillItemModel> billItems,
      required OtherDetailsBillModel model,
      required String sgst,
      required String cgst,
      required String tds,
      required String partyId}) async {
   return handleErrors(() => billsDataSource.addBill(
        date: date,
        billItems: billItems,
        sgst: sgst,
        cgst: cgst,
        tds: tds,
        partyId: partyId,
        model: model));
  }

  @override
  Future<List<BillModel>> allBiilsByParticularParty(
      {required String partyId}) async {
    List<BillModel> bills = [];
    try {
      bills = await billsDataSource.allBiilsByParticularParty(partyId: partyId);
    } catch (e) {
      print(e.toString());
    }
    return bills;
  }

  @override
  Future<FinancialModel> getFinancial() async {
    FinancialModel financialModel = FinancialModel("0", "0", "0", "0");
    try {
      financialModel = await billsDataSource.getFinancial();
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
      financialModel =
          await billsDataSource.getFinancialByPartyId(partyId: partyId);
      print(financialModel);
    } catch (e) {
      print(e.toString());
    }
    return financialModel;
  }
}
