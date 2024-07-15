import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/work_type_repository.dart';
import 'package:construction_mate/logic/models/work_type_model.dart';
import 'package:meta/meta.dart';

part 'worktype_event.dart';
part 'worktype_state.dart';

class WorktypeBloc extends Bloc<WorktypeEvent, WorktypeState> {
  final WorkTypesRepository workTypesRepository;
  WorktypeBloc(this.workTypesRepository) : super(WorktypeInitial()) {
    on<LoadWorkTypesEvent>(_onLoadWorkTypes);
  }

  void _onLoadWorkTypes(
      WorktypeEvent event, Emitter<WorktypeState> emit) async {
    emit(WorktypeInitial());
    List<WorkTypeModel> allWorkTypeList =
        await workTypesRepository.getAllWorkTypes();
    emit(WorkTypeLoadedSuccess(allWorkTypeList));
  }
}
