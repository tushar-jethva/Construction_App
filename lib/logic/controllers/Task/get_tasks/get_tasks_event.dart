part of 'get_tasks_bloc.dart';

@freezed
class GetTasksEvent with _$GetTasksEvent {
  //Initialize
  const factory GetTasksEvent.initialize() = _Initialize;

  //get tasks
  const factory GetTasksEvent.getTasks() = _GetTasks;
}
