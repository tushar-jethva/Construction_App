part of 'update_todo_bloc.dart';

@freezed
class UpdateTodoEvent with _$UpdateTodoEvent {
  //Initialize
  const factory UpdateTodoEvent.initialize() = _Initialize;

  //on todo id changed
  const factory UpdateTodoEvent.todoIdChanged({required String todoId}) =
      _TodoIdChanged;


  //update todos
  const factory UpdateTodoEvent.updateTodo(
      {required String taskId,
      required String todoId,
      required String status}) = _UpdateTodo;
}
