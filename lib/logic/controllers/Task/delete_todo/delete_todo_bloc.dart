import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/task_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'delete_todo_event.dart';
part 'delete_todo_state.dart';
part 'delete_todo_bloc.freezed.dart';

@singleton
class DeleteTodoBloc extends Bloc<DeleteTodoEvent, DeleteTodoState> {
  DeleteTodoBloc(this.taskUsecase) : super(DeleteTodoState.initial()) {
    on<DeleteTodoEvent>((event, emit) async {
      await event.map(
          started: (_Started value) {},
          deleteTodo: (_DeleteTodo value) async {
            emit(state.copyWith(state: RequestState.loading));
            final res = await taskUsecase.deleteTodo(
                todoId: value.todoId, taskId: value.taskId);

            res.fold((l) {
              emit(state.copyWith(
                state: RequestState.error,
                message: l.message,
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
