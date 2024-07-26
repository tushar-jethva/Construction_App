import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/models/transaction_model.dart';
import 'package:meta/meta.dart';

part 'transaction_building_event.dart';
part 'transaction_building_state.dart';

class TransactionBuildingBloc
    extends Bloc<TransactionBuildingEvent, TransactionBuildingState> {
  List<TransactionModel> _originalTransactions = [];
  final TransactionRepository transactionRepository;
  TransactionBuildingBloc({required this.transactionRepository})
      : super(TransactionBuildingLoading()) {
    on<FetchAllTransactionByProjectId>((event, emit) async {
      try {
        List<TransactionModel> listOfTransactions = await transactionRepository
            .getAllTransactionsByProjectId(projectId: event.projectId);
        _originalTransactions = listOfTransactions;
        emit(
            TransactionBuildingSuccess(listOfTransactions: listOfTransactions));
      } catch (e) {
        emit(TransactionBuildingError(error: e.toString()));
      }
    });

    on<FetchTransactionByQuery>((event, emit) {
      final query = event.query.toLowerCase().replaceAll(' ', '');
      if (query.isEmpty) {
        emit(TransactionBuildingSuccess(
            listOfTransactions: _originalTransactions));
      } else {
        final filteredTransactions = _originalTransactions.where((transaction) {
          final normalizedTransactionName =
              transaction.name!.toLowerCase().replaceAll(' ', '');
          return normalizedTransactionName.contains(query);
        }).toList();

        emit(TransactionBuildingSuccess(
            listOfTransactions: filteredTransactions));
      }
    });

    on<FetchTransactionsByDates>((event, emit) {
      try {
        final filteredTransactions = _originalTransactions.where((transaction) {
          final transactionDate = DateTime.parse(
              transaction.date!); // Assume `date` is a DateTime property

          return transactionDate.isAfter(event.startDate) &&
              transactionDate.isBefore(event.endDate.add(Duration(days: 1)));
        }).toList();

        emit(TransactionBuildingSuccess(
            listOfTransactions: filteredTransactions));
      } catch (e) {
        emit(TransactionBuildingError(error: e.toString()));
      }
    });

    on<ResetAll>((event, emit) {
      try {
        emit(TransactionBuildingSuccess(
            listOfTransactions: _originalTransactions));
      } catch (e) {
        emit(TransactionBuildingError(error: e.toString()));
      }
    });
  }
}
