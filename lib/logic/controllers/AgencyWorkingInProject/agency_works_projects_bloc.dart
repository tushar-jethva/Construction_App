import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/logic/models/total_agency_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'agency_works_projects_event.dart';
part 'agency_works_projects_state.dart';
part 'agency_works_projects_bloc.freezed.dart';

@singleton
class AgencyWorksProjectsBloc
    extends Bloc<AgencyWorksProjectsEvent, AgencyWorksProjectsState> {
  List<TotalAgencyModel> _originalTransactions = [];

  final AgencyRepository agencyRepository;
  AgencyWorksProjectsBloc({required this.agencyRepository})
      : super(AgencyWorksProjectsState.initial()) {
    on<AgencyWorksProjectsEvent>(
      (event, emit) async {
        await event.map(initialize: (_Initalize value) {
          emit(AgencyWorksProjectsState.initial());
        }, onQueryChanged: (_OnQueryChanged value) {
          emit(state.copyWith(state: RequestState.empty, query: value.query));
          final query = state.query.toLowerCase().replaceAll(' ', '');
          if (query.isNotEmpty) {
            final filteredTransactions =
                _originalTransactions.where((transaction) {
              final normalizedTransactionName =
                  transaction.name!.toLowerCase().replaceAll(' ', '');
              return normalizedTransactionName.contains(query);
            }).toList();

            emit(state.copyWith(
                state: RequestState.loaded,
                totalAgencies: filteredTransactions));
          } else {
            emit(state.copyWith(
                state: RequestState.loaded,
                totalAgencies: _originalTransactions));
          }
        }, fetchAgencies: (_FetchAgencies value) async {
          emit(state.copyWith(state: RequestState.loading));

          final res = await agencyRepository.getAgencyByProject(
              projectId: value.projectId);

          res.fold((l) {
            emit(state.copyWith(state: RequestState.error, message: l.message));
          }, (r) {
            _originalTransactions = r;
            emit(state.copyWith(state: RequestState.loaded, totalAgencies: r));
          });
        });
      },
    );
  }
}
