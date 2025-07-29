part of 'delete_todo_bloc.dart';

@freezed
class DeleteTodoEvent with _$DeleteTodoEvent {
  const factory DeleteTodoEvent.started() = _Started;

  //delete todo
  const factory DeleteTodoEvent.deleteTodo(
      {required String todoId, required String taskId}) = _DeleteTodo;
}
