part of 'update_task_status_bloc.dart';

@freezed
class UpdateTaskStatusState with _$UpdateTaskStatusState {
  const factory UpdateTaskStatusState({
    required RequestState state,
    required String message,
  }) = _UpdateTaskStatusState;
  factory UpdateTaskStatusState.initial() =>
      const UpdateTaskStatusState(state: RequestState.empty, message: '');
}
