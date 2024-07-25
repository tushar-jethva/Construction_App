import 'package:construction_mate/data/datasource/transaction_data_source.dart';
import 'package:construction_mate/logic/models/transaction_model.dart';

abstract class TransactionRepository {
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
}

class TransactionRepositoryImpl extends TransactionRepository {
  final TransactionDataSource transactionDataSource;

  TransactionRepositoryImpl({required this.transactionDataSource});

  @override
  Future<void> addPaymentOutTransaction(
      {required String description,
      required String agencyId,
      required String projectId,
      required String buildingId,
      required String amount}) async {
    try {
      await transactionDataSource.addPaymentOutTransaction(
          description: description,
          agencyId: agencyId,
          projectId: projectId,
          buildingId: buildingId,
          amount: amount);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<TransactionModel>> getAllTransactionsByProjectId(
      {required String projectId}) async {
    List<TransactionModel> listOfTransactions = [];
    try {
      listOfTransactions = await transactionDataSource
          .getAllTransactionsByProjectId(projectId: projectId);
    } catch (e) {
      print(e.toString());
    }
    return listOfTransactions.reversed.toList();
  }

  @override
  Future<List<TransactionModel>> getAllTransactionsByAgencyId(
      {required String agencyId}) async {
    List<TransactionModel> listOfTransactionsAgency = [];

    try {
      listOfTransactionsAgency = await transactionDataSource
          .getAllTransactionsByAgencyId(agencyId: agencyId);
    } catch (e) {
      print(e.toString());
    }
    return listOfTransactionsAgency;
  }
}