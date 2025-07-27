import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/task_usecase.dart';
import 'package:construction_mate/logic/models/tasks/get_task_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'task_by_id_event.dart';
part 'task_by_id_state.dart';
part 'task_by_id_bloc.freezed.dart';

@singleton
class TaskByIdBloc extends Bloc<TaskByIdEvent, TaskByIdState> {
  TaskByIdBloc(this.taskUsecase) : super(TaskByIdState.initial()) {
    on<TaskByIdEvent>((event, emit) async {
      await event.map(initialize: (_Initialize value) {
        emit(TaskByIdState.initial());
      }, getTaskById: (_GetTaskById value) async {
        emit(state.copyWith(state: RequestState.loading));

        final res = await taskUsecase.getTaskById(taskId: value.taskId);
        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) {
          emit(state.copyWith(state: RequestState.loaded, task: r));
        });
      });
    });
  }

  final TaskUsecase taskUsecase;
}
