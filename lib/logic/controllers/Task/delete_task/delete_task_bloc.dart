import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/task_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'delete_task_event.dart';
part 'delete_task_state.dart';
part 'delete_task_bloc.freezed.dart';

@singleton
class DeleteTaskBloc extends Bloc<DeleteTaskEvent, DeleteTaskState> {
  DeleteTaskBloc(this.taskUsecase) : super(DeleteTaskState.initial()) {
    on<DeleteTaskEvent>((event, emit) async {
      await event.map(started: (_Started value) {
        emit(DeleteTaskState.initial());
      }, deleteTask: (_DeleteTask value) async {
        emit(state.copyWith(state: RequestState.loading));
        final res = await taskUsecase.deleteTask(taskId: value.taskId);
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
