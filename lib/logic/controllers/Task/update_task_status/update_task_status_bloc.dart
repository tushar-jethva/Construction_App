import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/task_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'update_task_status_event.dart';
part 'update_task_status_state.dart';
part 'update_task_status_bloc.freezed.dart';

@singleton
class UpdateTaskStatusBloc
    extends Bloc<UpdateTaskStatusEvent, UpdateTaskStatusState> {
  UpdateTaskStatusBloc(this.taskUsecase)
      : super(UpdateTaskStatusState.initial()) {
    on<UpdateTaskStatusEvent>((event, emit) async {
      await event.map(started: (_Started value) {
        emit(UpdateTaskStatusState.initial());
      }, updateStatus: (_UpdateStatus value) async {
        emit(state.copyWith(state: RequestState.loading));
        final res = await taskUsecase.updateTaskStatus(
            taskId: value.taskId, status: value.status);
        res.fold((f) {
          emit(state.copyWith(
            state: RequestState.error,
            message: f.message,
          ));
        }, (r) {
          emit(state.copyWith(
            state: RequestState.loaded,
            message: r,
          ));
        });
      });
    });
  }

  final TaskUsecase taskUsecase;
}
