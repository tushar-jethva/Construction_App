import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/task_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'update_todo_event.dart';
part 'update_todo_state.dart';
part 'update_todo_bloc.freezed.dart';

@singleton
class UpdateTodoBloc extends Bloc<UpdateTodoEvent, UpdateTodoState> {
  UpdateTodoBloc(this.taskUsecase) : super(UpdateTodoState.initial()) {
    on<UpdateTodoEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize value) {
          emit(UpdateTodoState.initial());
        },
        todoIdChanged: (value) {
          emit(state.copyWith(state: RequestState.empty, todoId: value.todoId));
        },
        updateTodo: (_UpdateTodo value) async {
          emit(state.copyWith(state: RequestState.loading));

          final res = await taskUsecase.updateTodo(
              taskId: value.taskId, todoId: value.todoId, status: value.status);

          res.fold((l) {
            emit(state.copyWith(state: RequestState.error, message: l.message));
          }, (r) {
            emit(state.copyWith(state: RequestState.loaded, message: r));
          });
        },
      );
    });
  }
  final TaskUsecase taskUsecase;
}
