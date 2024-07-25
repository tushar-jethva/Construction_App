import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/models/transaction_model.dart';
import 'package:meta/meta.dart';

part 'transaction_by_agency_event.dart';
part 'transaction_by_agency_state.dart';

class TransactionByAgencyBloc
    extends Bloc<TransactionByAgencyEvent, TransactionByAgencyState> {
  List<TransactionModel> _originalTransactions = [];
  final TransactionRepository transactionRepository;
  TransactionByAgencyBloc({required this.transactionRepository})
      : super(TransactionByAgencyInitial()) {
    on<FetchAllTransactionByAgencyId>((event, emit) async {
      try {
        List<TransactionModel> listOfTransactions = await transactionRepository
            .getAllTransactionsByAgencyId(agencyId: event.agencyId);
        _originalTransactions = listOfTransactions;
        emit(TransactionByAgencySuccess(
            listOfTransactionsAgency: listOfTransactions));
      } catch (e) {
        emit(TransactionByAgencyFailure());
      }
    });

    on<FetchTransactionByQueryParties>((event, emit) {
      final query = event.query.toLowerCase().replaceAll(' ', '');
      if (query.isEmpty) {
        emit(TransactionByAgencySuccess(
            listOfTransactionsAgency: _originalTransactions));
      } else {
        final filteredTransactions = _originalTransactions.where((transaction) {
          final normalizedTransactionName =
              transaction.name!.toLowerCase().replaceAll(' ', '');
          return normalizedTransactionName.contains(query);
        }).toList();

        emit(TransactionByAgencySuccess(
            listOfTransactionsAgency: filteredTransactions));
      }
    });
  }
}
