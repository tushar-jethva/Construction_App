part of 'add_todo_bloc.dart';

@freezed
class AddTodoEvent with _$AddTodoEvent {
  //Initialize
  const factory AddTodoEvent.initialize() = _Initialize;

  //name changed
  const factory AddTodoEvent.nameChanged({required String name}) = _NameChanged;

  //Assignees
  const factory AddTodoEvent.assigneesChanged({required AgencyModel assignee}) =
      _AssigneesChanged;

  //remove assignee
  const factory AddTodoEvent.removeAssignee({required String assigneeId}) =
      _RemoveAssignee;

  //create todo
  const factory AddTodoEvent.createTodo({required String taskId}) = _CreateTodo;
}
