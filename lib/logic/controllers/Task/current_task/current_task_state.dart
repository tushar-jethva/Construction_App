part of 'current_task_bloc.dart';

@freezed
class CurrentTaskState with _$CurrentTaskState {
  const factory CurrentTaskState({required GetTaskModel? task}) =
      _CurrentTaskState;
   factory CurrentTaskState.initial() => CurrentTaskState(task: null);
}
