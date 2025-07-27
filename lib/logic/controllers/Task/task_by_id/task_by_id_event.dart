part of 'task_by_id_bloc.dart';

@freezed
class TaskByIdEvent with _$TaskByIdEvent {
  //Initialize
  const factory TaskByIdEvent.initialize() = _Initialize;

  //Get task by id
  const factory TaskByIdEvent.getTaskById({required String taskId}) =
      _GetTaskById;
}
