import 'dart:convert';

import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/transaction_model.dart';
import 'package:http/http.dart' as http;

abstract class TransactionDataSource {
  Future<void> addPaymentOutTransaction(
      {required String description,
      required String agencyId,
      required String projectId,
      required String buildingId,
      required String amount});

  Future<List<TransactionModel>> getAllTransactionsByProjectId(
      {required String projectId});

  Future<List<TransactionModel>> getAllTransactionsByAgencyId(
      {required String agencyId});

  Future<String> getTotalPaymentOut();
  Future<String> getTotalPaymentOutProject({required String projectId});
}

class TransactionDataSourceImpl extends TransactionDataSource {
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
      http.Response response = await http.post(
        Uri.parse(API.ADD_PAYMENT_OUT),
        body: transactionModel.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<TransactionModel>> getAllTransactionsByProjectId(
      {required String projectId}) async {
    List<TransactionModel> listOfTransactions = [];
    try {
      http.Response response = await http.get(
        Uri.parse("${API.GET_ALL_TRANSACTION_BY_PROJECT_ID}/${projectId}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(response.body);
      final transactions = jsonDecode(response.body);
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
      http.Response response = await http.get(
        Uri.parse("${API.GET_TRANSACTOIN_BY_AGENCY_ID}/${agencyId}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final transactions = jsonDecode(response.body);
      for (var transaction in transactions["data"]) {
        print(transaction);
        listOfTransactionsAgency.add(TransactionModel.fromMap(transaction));
      }
    } catch (e) {
      print(e.toString());
    }
    return listOfTransactionsAgency;
  }

  @override
  Future<String> getTotalPaymentOut() async {
    String total = "0";
    try {
      http.Response response = await http.get(
        Uri.parse("${API.GET_TOTAL_PAYMENT_OUT}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      final map = jsonDecode(response.body);
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
      http.Response response = await http.get(
        Uri.parse("${API.GET_TOTAL_PAYMENT_OUT_PROJECT}/$projectId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      final map = jsonDecode(response.body);
      total = map["ProjectPayOut"].toString();
    } catch (e) {
      print(e.toString());
    }
    return total;
  }
}
