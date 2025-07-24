part of 'add_task_bloc.dart';

@freezed
class AddTaskState with _$AddTaskState {
  const factory AddTaskState({
    required RequestState state,
    required String message,
    required List<AgencyModel> assignees,
    required DateTime? startDate,
    required DateTime? endDate,
    required String taskName,
    required String duration,
    required String progressUnit,
    required String estQuantity,
  }) = _AddTaskState;
  factory AddTaskState.initial() => const AddTaskState(
      state: RequestState.empty,
      message: '',
      assignees: [],
      startDate: null,
      endDate: null,
      taskName: '',
      duration: '',
      progressUnit: '',
      estQuantity: '');
}
