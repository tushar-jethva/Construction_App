part of 'update_task_progress_bloc.dart';

@freezed
class UpdateTaskProgressState with _$UpdateTaskProgressState {
  const factory UpdateTaskProgressState({
    required RequestState state,
    required String message,
    required num progress,
  }) = _UpdateTaskProgressState;
  factory UpdateTaskProgressState.initial() => const UpdateTaskProgressState(
      state: RequestState.empty, message: '', progress: 0);
}
