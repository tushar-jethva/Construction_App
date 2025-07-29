part of 'delete_task_bloc.dart';

@freezed
class DeleteTaskState with _$DeleteTaskState {
  const factory DeleteTaskState({
    required RequestState state,
    required String message,
  }) = _DeleteTaskState;
  factory DeleteTaskState.initial() =>
      const DeleteTaskState(state: RequestState.empty, message: '');
}
