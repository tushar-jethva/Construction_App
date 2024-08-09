import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/work_type_repository.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/work_type_model.dart';
import 'package:meta/meta.dart';

part 'add_agency_drop_downs_event.dart';
part 'add_agency_drop_downs_state.dart';

class AddAgencyDropDownsBloc
    extends Bloc<AddAgencyDropDownsEvent, AddAgencyDropDownsState> {
  final WorkTypesRepository workTypesRepository;
  final AgencyRepository agencyRepository;
  AddAgencyDropDownsBloc(
      {required this.workTypesRepository, required this.agencyRepository})
      : super(AddAgencyDropDownsState()) {
    on<FetchWorkTypesEvent>(_onFetchWorkTypes);
    on<FetchAgenciesEvent>(_onFetchAgencies);
    on<DropdownWorkTypeChangedEvent>(_onDropdownWorkTypeChanged);
    on<DropdownNameOfAgencyChangedEvent>(_onDropdownNameOfAgencyChanged);
    on<AddAgencyOfDropDownEvent>(_onAddAgency);
  }

  void _onFetchWorkTypes(
      FetchWorkTypesEvent event, Emitter<AddAgencyDropDownsState> emit) async {
    try {
      // Simulate API call
      emit(WorkTypeLoadingState(
        workTypes: state.workTypes,
        workTypeValue: state.workTypeValue,
        nameOfAgencyValue: state.nameOfAgencyValue,
        agencies: state.agencies,
      ));
      List<WorkTypeModel> allWorkTypeList =
          await workTypesRepository.getAllWorkTypes();
      allWorkTypeList.insert(0, WorkTypeModel(name: "--Select Work--"));
      emit(state.copyWith(workTypes: allWorkTypeList));
      emit(WorkTypeLoadedState(
        workTypes: state.workTypes,
        workTypeValue: state.workTypeValue,
        nameOfAgencyValue: state.nameOfAgencyValue,
        agencies: state.agencies,
      ));
      print("workvalue ${state.workTypeValue}");
    } catch (e) {
      // Handle error
      emit(AgencyFailureState(message: e.toString()));
    }
  }

  void _onFetchAgencies(
      FetchAgenciesEvent event, Emitter<AddAgencyDropDownsState> emit) async {
    try {
      // Simulate API call
      emit(LoadingState(
        workTypes: state.workTypes,
        workTypeValue: state.workTypeValue,
        nameOfAgencyValue: state.nameOfAgencyValue,
        agencies: state.agencies,
      ));
      List<AgencyModel> allAgencyByWorkType = await agencyRepository
          .getAgencyByWorkType(workTypeId: event.workTypeId);
      allAgencyByWorkType.insert(0, AgencyModel(name: "--Select Agency--"));
      emit(state.copyWith(agencies: allAgencyByWorkType));
      emit(AgencyLoadedState(
        workTypes: state.workTypes,
        workTypeValue: state.workTypeValue,
        nameOfAgencyValue: state.nameOfAgencyValue,
        agencies: state.agencies,
      ));
    } catch (e) {
      // Handle error
      emit(AgencyFailureState(message: e.toString()));
    }
  }

  void _onDropdownWorkTypeChanged(DropdownWorkTypeChangedEvent event,
      Emitter<AddAgencyDropDownsState> emit) {
    emit(state.copyWith(
        workTypeValue: event.value, nameOfAgencyValue: '', agencies: []));
    print(event.value);
    add(FetchAgenciesEvent(workTypeId: event.value));
  }

  void _onDropdownNameOfAgencyChanged(DropdownNameOfAgencyChangedEvent event,
      Emitter<AddAgencyDropDownsState> emit) {
    emit(state.copyWith(nameOfAgencyValue: event.value));
    emit(AgencyLoadedState(
      workTypes: state.workTypes,
      workTypeValue: state.workTypeValue,
      nameOfAgencyValue: state.nameOfAgencyValue,
      agencies: state.agencies,
    ));
    print("workvalue ${state.workTypeValue}");
  }

  void _onAddAgency(AddAgencyOfDropDownEvent event,
      Emitter<AddAgencyDropDownsState> emit) async {
    try {
      emit(AddAgencyLoadingState(
        workTypes: state.workTypes,
        workTypeValue: state.workTypeValue,
        nameOfAgencyValue: state.nameOfAgencyValue,
        agencies: state.agencies,
      ));

      await agencyRepository.addAgencyInBuilding(
          workTypeId: state.workTypeValue,
          agencyId: state.nameOfAgencyValue,
          floors: event.floors,
          pricePerFeet: event.pricePerFeet,
          name: "name",
          companyId: "",
          buildingId: event.buildingId,
          projectId: event.projectId,
          description: event.description);

      emit(AddAgencySuccessState(
        workTypes: state.workTypes,
        workTypeValue: state.workTypeValue,
        nameOfAgencyValue: state.nameOfAgencyValue,
        agencies: state.agencies,
      ));
    } catch (e) {
      emit(AddAgencyFailureState(
        workTypes: state.workTypes,
        workTypeValue: state.workTypeValue,
        nameOfAgencyValue: state.nameOfAgencyValue,
        agencies: state.agencies,
      ));
    }
  }
}
