import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/building_repository.dart';
import 'package:construction_mate/data/repository/project_repository.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:meta/meta.dart';

part 'payment_out_drop_down_event.dart';
part 'payment_out_drop_down_state.dart';

class PaymentOutDropDownBloc
    extends Bloc<PaymentOutDropDownEvent, PaymentOutDropDownState> {
  final BuildingRepository buildingRepository;
  final AgencyRepository agencyRepository;
  final ProjectRepository projectRepository;
  PaymentOutDropDownBloc(
      {required this.buildingRepository,
      required this.agencyRepository,
      required this.projectRepository})
      : super(PaymentOutDropDownState()) {
    on<FetchProjectsEvent>((event, emit) async {
      emit(ProjectsLoadingState(
          projectValue: state.projectValue,
          buildingValue: state.buildingValue,
          agencyValue: state.agencyValue,
          projects: state.projects,
          buildings: state.buildings,
          agencies: state.agencies));
      try {
        final projects = await projectRepository.allProjects();
        projects.insert(0, ProjectModel(name: "--Select Project--"));
        emit(state.copyWith(projects: projects));
        emit(ProjectsLoadedState(
            projectValue: state.projectValue,
            buildingValue: state.buildingValue,
            agencyValue: state.agencyValue,
            projects: state.projects,
            buildings: state.buildings,
            agencies: state.agencies));
      } catch (e) {
        print(e.toString());
      }
    });

    on<FetchBuildingsEvent>((event, emit) async {
      try {
        emit(BuildingsLoadingState(
            projectValue: state.projectValue,
            buildingValue: state.buildingValue,
            agencyValue: state.agencyValue,
            projects: state.projects,
            buildings: state.buildings,
            agencies: state.agencies));
        final buildings = await buildingRepository.allBuildingById(
            projectId: event.projectId);
        buildings.insert(0, BuildingModel(name: "--Select Building--"));
        emit(state.copyWith(buildings: buildings));

        emit(BuildingsLoadedState(
            projectValue: state.projectValue,
            buildingValue: state.buildingValue,
            agencyValue: state.agencyValue,
            projects: state.projects,
            buildings: state.buildings,
            agencies: state.agencies));
      } catch (e) {
        print(e.toString());
      }
    });

    on<FetchAgenciesEvent2>((event, emit) async {
      emit(AgenciesLoadingState(
          projectValue: state.projectValue,
          buildingValue: state.buildingValue,
          agencyValue: state.agencyValue,
          projects: state.projects,
          buildings: state.buildings,
          agencies: state.agencies));
      try {
        final agencies = await agencyRepository.getAgencyByBuildingId(
            buildingId: event.buildingId);
        agencies.insert(0, AgencyModel(name: "--Select Agency--"));
        emit(state.copyWith(agencies: agencies));

        emit(AgenciesLoadingState(
            projectValue: state.projectValue,
            buildingValue: state.buildingValue,
            agencyValue: state.agencyValue,
            projects: state.projects,
            buildings: state.buildings,
            agencies: state.agencies));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
