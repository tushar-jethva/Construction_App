import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/task_usecase.dart';
import 'package:construction_mate/logic/models/tasks/update_task_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'update_task_progress_event.dart';
part 'update_task_progress_state.dart';
part 'update_task_progress_bloc.freezed.dart';

@singleton
class UpdateTaskProgressBloc
    extends Bloc<UpdateTaskProgressEvent, UpdateTaskProgressState> {
  UpdateTaskProgressBloc(this.taskUsecase)
      : super(UpdateTaskProgressState.initial()) {
    on<UpdateTaskProgressEvent>((event, emit) async {
      await event.map(initialize: (_Initialize value) {
        emit(UpdateTaskProgressState.initial());
      }, onProgressChanged: (_OnProgressChanged value) {
        emit(state.copyWith(
            state: RequestState.empty, progress: value.progress));
      }, updateProgress: (_UpdateProgress value) async {
        emit(state.copyWith(state: RequestState.loading));
        UpdateTaskModel task = UpdateTaskModel(progress: state.progress);
        final res =
            await taskUsecase.updateTask(taskId: value.taskId, task: task);
        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) {
          emit(state.copyWith(state: RequestState.loaded, message: r));
        });
      });
    });
  }

  final TaskUsecase taskUsecase;
}
