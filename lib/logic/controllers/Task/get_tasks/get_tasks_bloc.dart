import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/task_usecase.dart';
import 'package:construction_mate/logic/controllers/Building-by-id/building_by_id_bloc.dart';
import 'package:construction_mate/logic/models/tasks/get_task_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_tasks_event.dart';
part 'get_tasks_state.dart';
part 'get_tasks_bloc.freezed.dart';

@singleton
class GetTasksBloc extends Bloc<GetTasksEvent, GetTasksState> {
  GetTasksBloc(this.buildingByIdBloc, this.taskUsecase)
      : super(GetTasksState.initial()) {
    on<GetTasksEvent>(
      (event, emit) async {
        await event.map(
          initialize: (_Initialize value) {
            emit(GetTasksState.initial());
          },
          getTasks: (_GetTasks value) async {
            emit(state.copyWith(state: RequestState.loading));

            final res = await taskUsecase.getTasks(
                projectId: buildingByIdBloc.state.project?.sId ?? '');

            res.fold(
              (l) {
                emit(state.copyWith(state: RequestState.error));
              },
              (r) {
                emit(state.copyWith(state: RequestState.loaded, tasks: r));
              },
            );
          },
        );
      },
    );
  }

  final BuildingByIdBloc buildingByIdBloc;
  final TaskUsecase taskUsecase;
}
