import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:meta/meta.dart';

part 'per_building_agencies_event.dart';
part 'per_building_agencies_state.dart';

class PerBuildingAgenciesBloc
    extends Bloc<PerBuildingAgenciesEvent, PerBuildingAgenciesState> {
  final AgencyRepository agencyRepository;
  PerBuildingAgenciesBloc({required this.agencyRepository})
      : super(PerBuildingAgenciesInitial()) {
    on<LoadAgencies>(_onLoadAgencies);
  }

  void _onLoadAgencies(
      LoadAgencies event, Emitter<PerBuildingAgenciesState> emit) async {
    emit(PerBuildingAgenciesInitial());
    List<PerBuildingAgencyModel> perBuildingAgencyList =
        await agencyRepository.getWorkingAgenciesOnBuilding(
            buildingId: event.buildingId, projectId: event.projectId);
    print("Helloage $perBuildingAgencyList");
    emit(PerBuildingAgenciesSuccess(agencies: perBuildingAgencyList));
  }
}
