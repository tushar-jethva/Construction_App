part of 'update_todo_bloc.dart';

@freezed
class UpdateTodoState with _$UpdateTodoState {
  const factory UpdateTodoState({
    required RequestState state,
    required String message,
    required String todoId,
  }) = _UpdateTodoState;
  factory UpdateTodoState.initial() =>
      const UpdateTodoState(state: RequestState.empty, message: '', todoId: '');
}
