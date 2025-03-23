import 'package:construction_mate/data/datasource/transaction_data_source.dart';
import 'package:construction_mate/logic/models/other_transaction_model.dart';
import 'package:construction_mate/logic/models/transaction_model.dart';
import 'package:construction_mate/utilities/error_handling/error_handler.dart';
import 'package:construction_mate/utilities/error_handling/failure.dart';
import 'package:construction_mate/utilities/extension/transaction_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class TransactionRepository {
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

  Future<Either<Failure, String?>> getTotalPaymentOut();

  Future<Either<Failure, String?>> getTotalPaymentOutProject(
      {required String projectId});

  Future<Either<Failure, String?>> getTotalPaymentIn();

  Future<Either<Failure, String?>> getTotalPaymentInProject(
      {required String projectId});

  Future<List<TransactionModel>> getAllTransactionByIndividualAgency(
      {required String agencyId, required String projectId});

  Future<Either<Failure, String>> addOtherTransaction(
      {required EntryType entryType,
      required String amount,
      required String description,
      required Transaction transactionType});

  Future<Either<Failure, String>> addOtherTransactionMaterialAndRent(
      {required OtherTransactionModel otherTransactionModel});
}

@LazySingleton(as: TransactionRepository)
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
      {required String agencyId,
      required String date,
      required String amount}) async {
    try {
      await transactionDataSource.addPaymentInTransaction(
          date: date, agencyId: agencyId, amount: amount);
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
  Future<Either<Failure, String?>> getTotalPaymentOut() async {
    return handleErrors(() => transactionDataSource.getTotalPaymentOut());
  }

  @override
  Future<Either<Failure, String?>> getTotalPaymentOutProject(
      {required String projectId}) async {
    return handleErrors(() =>
        transactionDataSource.getTotalPaymentOutProject(projectId: projectId));
  }

  @override
  Future<Either<Failure, String?>> getTotalPaymentInProject(
      {required String projectId}) async {
    return handleErrors(() =>
        transactionDataSource.getTotalPaymentInProject(projectId: projectId));
  }

  @override
  Future<Either<Failure, String?>> getTotalPaymentIn() async {
    return handleErrors(() => transactionDataSource.getTotalPaymentIn());
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

  @override
  Future<Either<Failure, String>> addOtherTransaction(
      {required EntryType entryType,
      required String amount,
      required String description,
      required Transaction transactionType}) {
    return handleErrors(() => transactionDataSource.addOtherTransaction(
        entryType: entryType,
        amount: amount,
        description: description,
        transactionType: transactionType));
  }

  @override
  Future<Either<Failure, String>> addOtherTransactionMaterialAndRent(
      {required OtherTransactionModel otherTransactionModel}) {
    return handleErrors(() =>
        transactionDataSource.addOtherTransactionMaterialAndRent(
            otherTransactionModel: otherTransactionModel));
  }
}
