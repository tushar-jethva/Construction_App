import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/task_usecase.dart';
import 'package:construction_mate/logic/models/tasks/get_to_do_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_todos_event.dart';
part 'get_todos_state.dart';
part 'get_todos_bloc.freezed.dart';

@singleton
class GetTodosBloc extends Bloc<GetTodosEvent, GetTodosState> {
  GetTodosBloc(this.taskUsecase) : super(GetTodosState.initial()) {
    on<GetTodosEvent>((event, emit) async {
      await event.map(initialize: (_Initialize value) {
        emit(GetTodosState.initial());
      }, getTodos: (_GetTodos value) async {
        emit(state.copyWith(state: RequestState.loading));
        final res = await taskUsecase.getTodo(taskId: value.taskId);
        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) {
          emit(state.copyWith(
              state: RequestState.loaded,
              todosPending: r.where((e) => e.status == "pending").toList(),
              todosCompleted:
                  r.where((e) => e.status == "completed").toList()));
        });
      });
    });
  }

  final TaskUsecase taskUsecase;
}
