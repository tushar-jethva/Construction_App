import 'package:construction_mate/data/datasource/transaction_data_source.dart';
import 'package:construction_mate/logic/models/transaction_model.dart';

abstract class TransactionRepository {
  Future<void> addPaymentOutTransaction(
      {required String description,
      required String agencyId,
      required String projectId,
      required String buildingId,
      required String amount});

  Future<void> addPaymentInTransaction(
      {required String projectId,
      required String agencyId,
      required String amount,
      required String description});

  Future<List<TransactionModel>> getAllTransactionsByProjectId(
      {required String projectId});

  Future<List<TransactionModel>> getAllTransactionsByAgencyId(
      {required String agencyId});

  Future<String> getTotalPaymentOut();
  Future<String> getTotalPaymentOutProject({required String projectId});
  Future<String> getTotalPaymentIn();
  Future<String> getTotalPaymentInProject({required String projectId});
  Future<List<TransactionModel>> getAllTransactionByIndividualAgency(
      {required String agencyId, required String projectId});
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
  Future<void> addPaymentInTransaction(
      {required String description,
      required String agencyId,
      required String projectId,
      required String amount}) async {
    try {
      await transactionDataSource.addPaymentInTransaction(
          description: description,
          agencyId: agencyId,
          projectId: projectId,
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
    return listOfTransactions;
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

  @override
  Future<String> getTotalPaymentOut() async {
    String total = "0";
    try {
      total = await transactionDataSource.getTotalPaymentOut();
    } catch (e) {
      print(e.toString());
    }
    return total;
  }

  @override
  Future<String> getTotalPaymentOutProject({required String projectId}) async {
    String total = "0";
    try {
      total = await transactionDataSource.getTotalPaymentOutProject(
          projectId: projectId);
    } catch (e) {
      print(e.toString());
    }
    return total;
  }

  @override
  Future<String> getTotalPaymentInProject({required String projectId}) async {
    String total = "0";
    try {
      total = await transactionDataSource.getTotalPaymentInProject(
          projectId: projectId);
    } catch (e) {
      print(e.toString());
    }
    return total;
  }

  @override
  Future<String> getTotalPaymentIn() async {
    String total = "0";
    try {
      total = await transactionDataSource.getTotalPaymentIn();
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
      transactionsOfIndividualAgency =
          await transactionDataSource.getAllTransactionByIndividualAgency(
              agencyId: agencyId, projectId: projectId);
    } catch (e) {
      print(e.toString());
    }
    return transactionsOfIndividualAgency;
  }
}
