import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/work_type_repository.dart';
import 'package:construction_mate/logic/models/agency_work_type_selection_model.dart';
import 'package:construction_mate/logic/models/work_type_model.dart';
import 'package:meta/meta.dart';

part 'agency_work_types_selection_event.dart';
part 'agency_work_types_selection_state.dart';

class AgencyWorkTypesSelectionBloc
    extends Bloc<AgencyWorkTypesSelectionEvent, AgencyWorkTypesSelectionState> {
  final WorkTypesRepository workTypesRepository;
  AgencyWorkTypesSelectionBloc({required this.workTypesRepository})
      : super(AgencyWorkTypesSelectionState()) {
    on<FetchWorkTypePartiesEvent>((event, emit) async {
      try {
        emit(state.copyWith(isLoading: true));
        List<WorkTypeModel> listOfWorkTypes =
            await workTypesRepository.getAllWorkTypes();
          
          if(state.agencyWorkTypeSelectedList.isEmpty){
            List<AgencyWorkTypeSelectModel> agencySelectWorkTypeList =
            listOfWorkTypes
                .map(
                  (e) => AgencyWorkTypeSelectModel(
                      sId: e.sId, name: e.name, isSelected: false),
                )
                .toList();
          }
          else{
            List<AgencyWorkTypeSelectModel> agencySelectWorkTypeList =
            listOfWorkTypes.map((e) => state.agencyWorkTypeSelectedList.map((i) => e.name != i.name? AgencyWorkTypeSelectModel(sId: e.sId,name: e.name,isSelected: false) : AgencyWorkTypeSelectModel(sId: i.sId,name: i.name,isSelected: i.isSelected)).toList());
          }
        emit(
          state.copyWith(
              agencyWorkTypeSelectedList: agencySelectWorkTypeList,
              isLoading: false),
        );
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

    on<OnAddWorkTypeButtonPressed>((event, emit) async{

      try{
          String res = await workTypesRepository.addWorkType(workTypeName: event.name);
          add(FetchWorkTypePartiesEvent());
      }
      catch(e){

      }
    });

    // on<ToggleWorkTypeSelectAll>((event, emit) {
    //   final selectAll = !state.selectAll;
    //   List<AgencyWorkTypeSelectModel> currentSelectedAgencies =
    //       state.agencyWorkTypeSelectedList.map((workType) {
    //     return AgencyWorkTypeSelectModel(
    //         name: workType.name!, sId: workType.sId!, isSelected: selectAll);
    //   }).toList();
    //   emit(state.copyWith(
    //       selectAll: selectAll,
    //       agencyWorkTypeSelectedList: currentSelectedAgencies));
    // });
  }
}
