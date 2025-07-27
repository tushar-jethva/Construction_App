part of 'add_task_bloc.dart';

@freezed
class AddTaskEvent with _$AddTaskEvent {
  //Initialize
  const factory AddTaskEvent.initialize() = _Initialize;

  //Task name
  const factory AddTaskEvent.taskNameChanged({required String taskName}) =
      _TaskNameChanged;

  //Duration
  const factory AddTaskEvent.durationChanged({required String duration}) =
      _DurationChanged;

  //Progress unit
  const factory AddTaskEvent.progressUnitChanged(
      {required String progressUnit}) = _ProgressUnitChanged;

  //Est quantity
  const factory AddTaskEvent.estQuantityChanged({required String estQuantity}) =
      _EstQuantityChanged;

  //Start date
  const factory AddTaskEvent.startDateChanged({required DateTime startDate}) =
      _StartDateChanged;

  //End date
  const factory AddTaskEvent.endDateChanged({required DateTime endDate}) =
      _EndDateChanged;

  //Assignees
  const factory AddTaskEvent.assigneesChanged(
      {required List<AgencyModel> assignees}) = _AssigneesChanged;

  //remove assignee
  const factory AddTaskEvent.removeAssignee({required String assigneeId}) =
      _RemoveAssignee;

  //add task
  const factory AddTaskEvent.addTask() = _AddTask;
}
