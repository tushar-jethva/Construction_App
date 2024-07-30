import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/work_type_repository.dart';
import 'package:construction_mate/logic/models/agency_work_type_selection_model.dart';
import 'package:construction_mate/logic/models/work_type_model.dart';
import 'package:meta/meta.dart';

part 'agency_work_types_selection_event.dart';
part 'agency_work_types_selection_state.dart';

class AgencyWorkTypesSelectionBloc
    extends Bloc<AgencyWorkTypesSelectionEvent, AgencyWorkTypesSelectionState> {
  final WorkTypesRepository workTypesRepository;
  final AgencyRepository agencyRepository;
  AgencyWorkTypesSelectionBloc(
      {required this.workTypesRepository, required this.agencyRepository})
      : super(AgencyWorkTypesSelectionState()) {
    on<FetchWorkTypePartiesEvent>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));
        List<WorkTypeModel> listOfWorkTypes =
            await workTypesRepository.getAllWorkTypes();

        if (state.agencyWorkTypeSelectedList.isEmpty) {
          List<AgencyWorkTypeSelectModel> agencySelectWorkTypeList =
              listOfWorkTypes
                  .map(
                    (e) => AgencyWorkTypeSelectModel(
                        sId: e.sId, name: e.name, isSelected: false),
                  )
                  .toList();
          emit(
            state.copyWith(
                agencyWorkTypeSelectedList: agencySelectWorkTypeList,
                isLoading: false),
          );
        } else {
          List<AgencyWorkTypeSelectModel> agencySelectWorkTypeList =
              listOfWorkTypes.map((e) {
            // Check if there's a matching item in state.agencyWorkTypeSelectedList
            final matchingItem = state.agencyWorkTypeSelectedList.firstWhere(
              (i) => e.sId == i.sId,
              orElse: () => AgencyWorkTypeSelectModel(
                  sId: e.sId, name: e.name, isSelected: false),
            );

            // Create a new model based on whether there's a match
            return AgencyWorkTypeSelectModel(
              sId: e.sId,
              name: e.name,
              isSelected: matchingItem.isSelected,
            );
          }).toList();
          emit(
            state.copyWith(
                agencyWorkTypeSelectedList: agencySelectWorkTypeList,
                isLoading: false),
          );
        }
      } catch (e) {}
    });

    on<ToggleWorkTypeSelection>((event, emit) {
      final currentSelectedAgencies = List<AgencyWorkTypeSelectModel>.from(
          state.agencyWorkTypeSelectedList);
      currentSelectedAgencies[event.index].isSelected =
          !currentSelectedAgencies[event.index].isSelected!;
      final selectAll =
          currentSelectedAgencies.every((selected) => selected.isSelected!);
      emit(state.copyWith(
        agencyWorkTypeSelectedList: currentSelectedAgencies,
        selectAll: selectAll,
      ));
    });

    on<OnAddWorkTypeButtonPressed>((event, emit) async {
      try {
        await workTypesRepository.addWorkType(workTypeName: event.name);
        add(FetchWorkTypePartiesEvent());
      } catch (e) {}
    });

    on<OnAddAgencyPartiesButtonPressed>((event, emit) async {
      emit(state.copyWith(isAddedAgency: 1));
      await agencyRepository.addAgency(
          name: event.name,
          description: event.description,
          workTypeIds: state.agencyWorkTypeSelectedList
              .where((element) => element.isSelected == true)
              .map((e) => e.sId!)
              .toList());
      emit(state.copyWith(isAddedAgency: 2));
      
    });
  }
}
