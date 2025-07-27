part of 'get_tasks_bloc.dart';

@freezed
class GetTasksState with _$GetTasksState {
  const factory GetTasksState({
    required RequestState state,
    required String message,
    required List<GetTaskModel> tasks,
  }) = _GetTasksState;
  factory GetTasksState.initial() =>
      const GetTasksState(state: RequestState.empty, message: '', tasks: []);
}
