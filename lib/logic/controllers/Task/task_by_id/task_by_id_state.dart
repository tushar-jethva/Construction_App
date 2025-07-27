part of 'task_by_id_bloc.dart';

@freezed
class TaskByIdState with _$TaskByIdState {
  const factory TaskByIdState({
    required RequestState state,
    required String message,
    required GetTaskModel? task,
  }) = _TaskByIdState;
  factory TaskByIdState.initial() =>
      const TaskByIdState(state: RequestState.empty, message: '', task: null);
}
