import 'dart:convert';
import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/other_transaction_model.dart';
import 'package:construction_mate/logic/models/transaction_model.dart';
import 'package:construction_mate/utilities/dio_config/base_data_center.dart';
import 'package:construction_mate/utilities/extension/transaction_extension.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class TransactionDataSource {
  Future<void> addPaymentOutTransaction(
      {required String description,
      required String agencyId,
      required String projectId,
      required String buildingId,
      required String amount});

  Future<void> addPaymentInTransaction({
    required String date,
    required String agencyId,
    required String amount,
  });

  Future<List<TransactionModel>> getAllTransactionsByProjectId(
      {required String projectId});

  Future<List<TransactionModel>> getAllTransactionsByAgencyId(
      {required String agencyId});

  Future<String?> getTotalPaymentOut();
  Future<String> getTotalPaymentOutProject({required String projectId});
  Future<String?> getTotalPaymentIn();
  Future<String> getTotalPaymentInProject({required String projectId});
  Future<List<TransactionModel>> getAllTransactionByIndividualAgency(
      {required String agencyId, required String projectId});

  Future<String> addOtherTransaction(
      {required EntryType entryType,
      required String amount,
      required String description,
      required Transaction transactionType});

  Future<String> addOtherTransactionMaterialAndRent(
      {required OtherTransactionModel otherTransactionModel});
}

@LazySingleton(as: TransactionDataSource)
class TransactionDataSourceImpl extends TransactionDataSource {
  final dio = BaseDataCenter().dio.dio;

  @override
  Future<void> addPaymentOutTransaction(
      {required String description,
      required String agencyId,
      required String projectId,
      required String buildingId,
      required String amount}) async {
    try {
      TransactionModel transactionModel = TransactionModel(
          description: description,
          projectId: projectId,
          agencyId: agencyId,
          buildingId: buildingId,
          amount: amount,
          taskId: "",
          entryType: "Debit");
      print("$description $agencyId $projectId $buildingId");
      final response = await dio.post(
        API.ADD_PAYMENT_OUT,
        data: transactionModel.toJson(),
      );
      print(response.data);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> addPaymentInTransaction(
      {required String date,
      required String agencyId,
      required String amount}) async {
    try {
      final response = await dio.post(
        API.ADD_PAYMENT_IN,
        data:
            jsonEncode({"PartieId": agencyId, "date": date, "Amount": amount}),
      );
      print(response.data);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<TransactionModel>> getAllTransactionsByProjectId(
      {required String projectId}) async {
    List<TransactionModel> listOfTransactions = [];
    try {
      final response = await dio.get(
        "${API.GET_ALL_TRANSACTION_BY_PROJECT_ID}/$projectId",
      );
      final transactions = response.data;
      for (var transaction in transactions["data"]) {
        listOfTransactions.add(TransactionModel.fromMap(transaction));
      }
    } catch (e) {
      print(e.toString());
    }
    return listOfTransactions;
  }

  @override
  Future<List<TransactionModel>> getAllTransactionsByAgencyId(
      {required String agencyId}) async {
    List<TransactionModel> listOfTransactionsAgency = [];

    try {
      final response =
          await dio.get("${API.GET_TRANSACTOIN_BY_AGENCY_ID}/${agencyId}");
      final transactions = response.data;
      for (var transaction in transactions["data"]) {
        listOfTransactionsAgency.add(TransactionModel.fromMap(transaction));
      }
    } catch (e) {}
    return listOfTransactionsAgency;
  }

  @override
  Future<String?> getTotalPaymentOut() async {
    String total = "0";
    try {
      final response = await dio.get(
        API.GET_TOTAL_PAYMENT_OUT,
      );

      final map = response.data;
      total = map["TotalPayOut"].toString();
    } catch (e) {
      print(e.toString());
    }
    return total;
  }

  @override
  Future<String> getTotalPaymentOutProject({required String projectId}) async {
    String total = "0";
    try {
      final response = await dio.get(
        "${API.GET_TOTAL_PAYMENT_OUT_PROJECT}/$projectId",
      );

      final map = response.data;
      total = map["ProjectPayOut"].toString();
    } catch (e) {
      print(e.toString());
    }
    return total;
  }

  @override
  Future<String?> getTotalPaymentIn() async {
    String total = "0";
    try {
      final response = await dio.get(
        API.GET_TOTAL_PAYMENT_IN,
      );

      final map = response.data;
      total = map["PayIn"].toString();
    } catch (e) {
      print(e.toString());
    }
    return total;
  }

  @override
  Future<String> getTotalPaymentInProject({required String projectId}) async {
    String total = "0";
    try {
      final response = await dio.get(
        "${API.GET_TOTAL_PAYMENT_IN}/$projectId",
      );

      final map = response.data;
      total = map["PayIn"].toString();
    } catch (e) {
      print(e.toString());
    }
    return total;
  }

  @override
  Future<List<TransactionModel>> getAllTransactionByIndividualAgency(
      {required String agencyId, required String projectId}) async {
    List<TransactionModel> transactionsOfIndividualAgency = [];
    try {
      final response = await dio.post(
        API.GET_TRANSACTION_BY_INDIVIDUAL_AGENCIES,
        data: jsonEncode({"agencyId": agencyId, "projectId": projectId}),
      );
      print(response.data);
      final map = response.data;
      for (var agency in map["data"]) {
        transactionsOfIndividualAgency.add(TransactionModel.fromMap(agency));
      }
    } catch (e) {
      print(e.toString());
    }
    return transactionsOfIndividualAgency;
  }

  @override
  Future<String> addOtherTransaction(
      {required EntryType entryType,
      required String amount,
      required String description,
      required Transaction transactionType}) async {
    try {
      final res = await dio.post(API.ADD_OTHER_TRANSACTIONS,
          data: jsonEncode({
            "entryType": entryType.name,
            "amount": amount,
            "description": description,
            "transactionType": transactionType.name
          }));

      return res.data['message'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> addOtherTransactionMaterialAndRent(
      {required OtherTransactionModel otherTransactionModel}) async {
    try {
      debugPrint("========= other trans ${otherTransactionModel.toJson()}");
      final res = await dio.post(API.ADD_OTHER_TRANSACTIONS,
          data: jsonEncode(otherTransactionModel.toJson()));

      return res.data['message'];
    } catch (e) {
      rethrow;
    }
  }
}
