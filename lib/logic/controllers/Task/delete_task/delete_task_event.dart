part of 'delete_task_bloc.dart';

@freezed
class DeleteTaskEvent with _$DeleteTaskEvent {
  //Initialize
  const factory DeleteTaskEvent.started() = _Started;

  //delete task
  const factory DeleteTaskEvent.deleteTask({required String taskId}) =
      _DeleteTask;
}
