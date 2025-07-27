part of 'get_todos_bloc.dart';

@freezed
class GetTodosState with _$GetTodosState {
  const factory GetTodosState({
    required RequestState state,
    required String message,
    required List<GetTodoModel> todosPending,
    required List<GetTodoModel> todosCompleted,
  }) = _GetTodosState;
  factory GetTodosState.initial() => const GetTodosState(
      state: RequestState.empty,
      message: '',
      todosCompleted: [],
      todosPending: []);
}
