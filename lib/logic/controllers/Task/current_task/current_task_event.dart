part of 'current_task_bloc.dart';

@freezed
class CurrentTaskEvent with _$CurrentTaskEvent {
  const factory CurrentTaskEvent.setCurrentTask({required GetTaskModel? task}) =
      _SetCurrentTask;
}
