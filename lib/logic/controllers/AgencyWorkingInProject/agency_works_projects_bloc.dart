import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/logic/models/total_agency_model.dart';
import 'package:meta/meta.dart';

part 'agency_works_projects_event.dart';
part 'agency_works_projects_state.dart';

class AgencyWorksProjectsBloc
    extends Bloc<AgencyWorksProjectsEvent, AgencyWorksProjectsState> {
  List<TotalAgencyModel> _originalTransactions = [];

  final AgencyRepository agencyRepository;
  AgencyWorksProjectsBloc({required this.agencyRepository})
      : super(AgencyWorksProjectsInitial()) {
    on<LoadTotalProjectAgencies>(_onLoadAgencies);
    on<FetchTransactionByQueryProjectAgency>(_onSearchQueryTotalAgency);
  }

  void _onLoadAgencies(LoadTotalProjectAgencies event,
      Emitter<AgencyWorksProjectsState> emit) async {
    try {
      emit(AgencyWorksProjectsInitial());
      List<TotalAgencyModel> totalAgencies =
          await agencyRepository.getAgencyByProject(projectId: event.projectId);
      _originalTransactions = totalAgencies;
      emit(AgencyWorksProjectsSuccess(totalAgencies: totalAgencies));
    } catch (e) {
      emit(AgencyWorksProjectsFailure(message: e.toString()));
    }
  }

  void _onSearchQueryTotalAgency(FetchTransactionByQueryProjectAgency event,
      Emitter<AgencyWorksProjectsState> emit) {
    try {
      final query = event.query.toLowerCase().replaceAll(' ', '');
      if (query.isEmpty) {
        emit(AgencyWorksProjectsSuccess(totalAgencies: _originalTransactions));
      } else {
        final filteredTransactions = _originalTransactions.where((transaction) {
          final normalizedTransactionName =
              transaction.name!.toLowerCase().replaceAll(' ', '');
          return normalizedTransactionName.contains(query);
        }).toList();

        emit(AgencyWorksProjectsSuccess(totalAgencies: filteredTransactions));
      }
    } catch (e) {
      emit(AgencyWorksProjectsFailure(message: e.toString()));
    }
  }
}
