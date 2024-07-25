import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/logic/models/total_agency_model.dart';
import 'package:meta/meta.dart';

part 'total_agencies_event.dart';
part 'total_agencies_state.dart';

class TotalAgenciesBloc extends Bloc<TotalAgenciesEvent, TotalAgenciesState> {
  final AgencyRepository agencyRepository;
  TotalAgenciesBloc({required this.agencyRepository})
      : super(TotalAgenciesInitial()) {
    on<LoadTotalAgencies>(_onLoadAgencies);
  }

  void _onLoadAgencies(
      LoadTotalAgencies event, Emitter<TotalAgenciesState> emit) async {
    try {
      emit(TotalAgenciesInitial());
      List<TotalAgencyModel> totalAgencies =
          await agencyRepository.getTotalAgencies();
      emit(TotalAgenciesLoadSuccess(totalAgencies: totalAgencies));
    } catch (e) {
      emit(TotalAgenciesLoadFailure());
    }
  }
}
