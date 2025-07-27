part of 'add_todo_bloc.dart';

@freezed
class AddTodoState with _$AddTodoState {
  const factory AddTodoState({
    required RequestState state,
    required String message,
    required String name,
    required List<AgencyModel> assignees,
  }) = _AddTodoState;
  factory AddTodoState.initial() => const AddTodoState(
      state: RequestState.empty, message: '', name: '', assignees: []);
}
