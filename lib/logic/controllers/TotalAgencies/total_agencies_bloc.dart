import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/logic/models/total_agency_model.dart';
import 'package:meta/meta.dart';

part 'total_agencies_event.dart';
part 'total_agencies_state.dart';

class TotalAgenciesBloc extends Bloc<TotalAgenciesEvent, TotalAgenciesState> {
  List<TotalAgencyModel> _originalTransactions = [];

  final AgencyRepository agencyRepository;
  TotalAgenciesBloc({required this.agencyRepository})
      : super(TotalAgenciesInitial()) {
    on<LoadTotalAgencies>(_onLoadAgencies);
    on<FetchTransactionByQueryTotalAgency>(_onSearchQueryTotalAgency);
  }

  void _onLoadAgencies(
      LoadTotalAgencies event, Emitter<TotalAgenciesState> emit) async {
    try {
      emit(TotalAgenciesInitial());
      List<TotalAgencyModel> totalAgencies =
          await agencyRepository.getTotalAgencies();
      _originalTransactions = totalAgencies;
      emit(TotalAgenciesLoadSuccess(totalAgencies: totalAgencies));
    } catch (e) {
      emit(TotalAgenciesLoadFailure());
    }
  }

  void _onSearchQueryTotalAgency(FetchTransactionByQueryTotalAgency event,
      Emitter<TotalAgenciesState> emit) {
    final query = event.query.toLowerCase().replaceAll(' ', '');
    if (query.isEmpty) {
      emit(TotalAgenciesLoadSuccess(totalAgencies: _originalTransactions));
    } else {
      final filteredTransactions = _originalTransactions.where((transaction) {
        final normalizedTransactionName =
            transaction.name!.toLowerCase().replaceAll(' ', '');
        return normalizedTransactionName.contains(query);
      }).toList();

      emit(TotalAgenciesLoadSuccess(totalAgencies: filteredTransactions));
    }
  }
}
