part of 'get_todos_bloc.dart';

@freezed
class GetTodosEvent with _$GetTodosEvent {
  //Initialize
  const factory GetTodosEvent.initialize() = _Initialize;

  //get todos
  const factory GetTodosEvent.getTodos({required String taskId}) = _GetTodos;
}
