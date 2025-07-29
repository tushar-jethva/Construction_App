part of 'delete_todo_bloc.dart';

@freezed
class DeleteTodoState with _$DeleteTodoState {
  const factory DeleteTodoState({
    required RequestState state,
    required String message,
  }) = _DeleteTodoState;

  factory DeleteTodoState.initial() =>
      const DeleteTodoState(state: RequestState.empty, message: '');
}
