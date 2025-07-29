part of 'update_task_status_bloc.dart';

@freezed
class UpdateTaskStatusEvent with _$UpdateTaskStatusEvent {
  //Initialize
  const factory UpdateTaskStatusEvent.started() = _Started;

  //Update progress
  const factory UpdateTaskStatusEvent.updateStatus(
      {required String taskId, required String status}) = _UpdateStatus;
}
