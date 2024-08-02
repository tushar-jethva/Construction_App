import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/models/transaction_model.dart';
import 'package:meta/meta.dart';

part 'transactions_individual_agency_event.dart';
part 'transactions_individual_agency_state.dart';

class TransactionsIndividualAgencyBloc extends Bloc<
    TransactionsIndividualAgencyEvent, TransactionsIndividualAgencyState> {
  final TransactionRepository transactionRepository;
  List<TransactionModel> _originalTransactions = [];

  TransactionsIndividualAgencyBloc({required this.transactionRepository})
      : super(TransactionsIndividualAgencyInitial()) {
    on<FetchIndividualTransactionsOfAgency>((event, emit) async {
      try {
        emit(TransactionsIndividualAgencyInitial());
        List<TransactionModel> listOfIndividualTransactions =
            await transactionRepository.getAllTransactionByIndividualAgency(
                agencyId: event.agencyId, projectId: event.projectId);
        _originalTransactions = listOfIndividualTransactions;
        emit(TransactionsIndividualAgencySuccess(
            listOfIndividualTransactions: listOfIndividualTransactions));
      } catch (e) {
        emit(TransactionsIndividualAgencyFailure());
      }
    });

    on<FetchTransactionByQueryIndividual>((event, emit) {
      final query = event.query.toLowerCase().replaceAll(' ', '');
      if (query.isEmpty) {
        emit(TransactionsIndividualAgencySuccess(
            listOfIndividualTransactions: _originalTransactions));
      } else {
        final filteredTransactions = _originalTransactions.where((transaction) {
          final normalizedTransactionName =
              transaction.description!.toLowerCase().replaceAll(' ', '');
          return normalizedTransactionName.contains(query);
        }).toList();

        emit(TransactionsIndividualAgencySuccess(
            listOfIndividualTransactions: filteredTransactions));
      }
    });

    on<FetchTransactionsByDatesIndividual>((event, emit) {
      try {
        final filteredTransactions = _originalTransactions.where((transaction) {
          final transactionDate = DateTime.parse(
              transaction.date!); // Assume `date` is a DateTime property

          return transactionDate.isAfter(event.startDate) &&
              transactionDate.isBefore(event.endDate.add(Duration(days: 1)));
        }).toList();

        emit(TransactionsIndividualAgencySuccess(
            listOfIndividualTransactions: filteredTransactions));
      } catch (e) {
        emit(TransactionsIndividualAgencyFailure());
      }
    });

    on<ResetAllIndividualDate>((event, emit) {
      try {
        emit(TransactionsIndividualAgencySuccess(
            listOfIndividualTransactions: _originalTransactions));
      } catch (e) {
        emit(TransactionsIndividualAgencyFailure());
      }
    });
  }
}
