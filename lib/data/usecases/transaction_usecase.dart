import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/models/other_transaction_model.dart';
import 'package:construction_mate/utilities/error_handling/failure.dart';
import 'package:construction_mate/utilities/extension/transaction_extension.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class TransactionUsecase {
  final TransactionRepository _repository;
  TransactionUsecase(this._repository);

  @override
  Future<Either<Failure, String>> addOtherTransaction(
      {required EntryType entryType,
      required String amount,
      required String description,
      required Transaction transactionType}) {
    return _repository.addOtherTransaction(
        entryType: entryType,
        amount: amount,
        description: description,
        transactionType: transactionType);
  }

  Future<Either<Failure, String>> addOtherTransactionMaterialAndRent(
      {required OtherTransactionModel otherTransactionModel}) {
    return _repository.addOtherTransactionMaterialAndRent(
        otherTransactionModel: otherTransactionModel);
  }
}
