import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/building_repository.dart';
import 'package:construction_mate/data/repository/project_repository.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/drop_down_agency_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'payment_out_drop_down_event.dart';
part 'payment_out_drop_down_state.dart';

@singleton
class PaymentOutDropDownBloc
    extends Bloc<PaymentOutDropDownEvent, PaymentOutDropDownState> {
  final BuildingRepository buildingRepository;
  final AgencyRepository agencyRepository;
  final ProjectRepository projectRepository;
  final TransactionRepository transactionRepository;
  PaymentOutDropDownBloc(
      {required this.buildingRepository,
      required this.agencyRepository,
      required this.projectRepository,
      required this.transactionRepository})
      : super(PaymentOutDropDownState()) {
    on<FetchProjectsEvent>((event, emit) async {
      emit(ProjectsLoadingState(
          projectValue: state.projectValue,
          buildingValue: state.buildingValue,
          agencyValue: state.agencyValue,
          projects: state.projects,
          buildings: state.buildings,
          agencies: state.agencies,
          partyType: state.partyType));
      try {
        final projects = await projectRepository.allProjects();
        projects.insert(0, ProjectModel(name: "--Select Project--", sId: '0'));
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

    on<AgencyTypeChangeEvent>((event, emit) async {
      emit(state.copyWith(
        partyType: event.partyType,
      ));
      emit(BuildingsLoadedState(
          projectValue: state.projectValue,
          buildingValue: state.buildings.isNotEmpty
              ? state.buildings[0].sId.toString()
              : "",
          agencyValue: '',
          projects: state.projects,
          buildings: state.buildings,
          agencies: [],
          partyType: state.partyType));
    });

    on<FetchBuildingsEvent>((event, emit) async {
      try {
        emit(BuildingsLoadingState(
            projectValue: state.projectValue,
            buildingValue: state.buildingValue,
            agencyValue: state.agencyValue,
            projects: state.projects,
            buildings: state.buildings,
            agencies: state.agencies,
            partyType: state.partyType));
        final buildings = await buildingRepository.allBuildingById(
            projectId: event.projectId);
        buildings.insert(
            0, BuildingModel(name: "--Select Building--", sId: '0'));
        emit(state.copyWith(
            buildings: buildings, projectValue: event.projectId));
        print(state.buildings);
        emit(BuildingsLoadedState(
            projectValue: state.projectValue,
            buildingValue: state.buildings[0].sId.toString(),
            agencyValue: '',
            projects: state.projects,
            buildings: state.buildings,
            agencies: [],
            partyType: state.partyType));
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
          agencies: state.agencies,
          partyType: state.partyType));
      try {
        final agencies =
            await agencyRepository.getWorkingAgenciesOnBuildingForDropDown(
                buildingId: event.buildingId, projectId: event.projectId);
        print(agencies);
        agencies.insert(
            0,
            DropDownAgencyModel(
                agencyName: "--Select Agency--", agencyId: '0'));
        emit(state.copyWith(
            agencies: agencies, buildingValue: event.buildingId));

        emit(AgenciesLoadedState(
            projectValue: state.projectValue,
            buildingValue: state.buildingValue,
            agencyValue: state.agencyValue,
            projects: state.projects,
            buildings: state.buildings,
            agencies: state.agencies,
            partyType: state.partyType));
      } catch (e) {
        print(e.toString());
      }
    });

    on<AgencyValueChanged>((event, emit) async {
      debugPrint("========== agency value ==== ${event.agencyId} ==========");
      emit(state.copyWith(agencyValue: event.agencyId));
      emit(AgenciesLoadedState(
          projectValue: state.projectValue,
          buildingValue: state.buildingValue,
          agencyValue: state.agencyValue,
          projects: state.projects,
          buildings: state.buildings,
          agencies: state.agencies,
          partyType: state.partyType));
    });

    on<AddPaymentOutTransaction>((event, emit) async {
      try {
        emit(PaymentOutAddLoading(
            projectValue: state.projectValue,
            buildingValue: state.buildingValue,
            agencyValue: state.agencyValue,
            projects: state.projects,
            buildings: state.buildings,
            agencies: state.agencies,
            partyType: state.partyType));
        await transactionRepository.addPaymentOutTransaction(
            description: event.description,
            agencyId: state.agencyValue,
            projectId: state.projectValue,
            buildingId: state.buildingValue,
            amount: event.amount);
        emit(PaymentOutAddSuccess(
            projectValue: state.projectValue,
            buildingValue: state.buildingValue,
            agencyValue: state.agencyValue,
            projects: state.projects,
            buildings: state.buildings,
            agencies: state.agencies,
            partyType: state.partyType));
      } catch (e) {
        emit(PaymentOutAddFailure(
            projectValue: state.projectValue,
            buildingValue: state.buildingValue,
            agencyValue: state.agencyValue,
            projects: state.projects,
            buildings: state.buildings,
            agencies: state.agencies,
            partyType: state.partyType));
      }
    });
  }
}
