part of 'update_task_progress_bloc.dart';

@freezed
class UpdateTaskProgressEvent with _$UpdateTaskProgressEvent {
  //Initialize
  const factory UpdateTaskProgressEvent.initialize() = _Initialize;

  //on progress changed
  const factory UpdateTaskProgressEvent.onProgressChanged(
      {required num progress}) = _OnProgressChanged;

  //Update progress
  const factory UpdateTaskProgressEvent.updateProgress(
      {required String taskId}) = _UpdateProgress;
}
