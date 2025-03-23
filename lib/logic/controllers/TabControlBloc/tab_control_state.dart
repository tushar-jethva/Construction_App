part of 'tab_control_bloc.dart';

@freezed
class TabControlState with _$TabControlState {
  const factory TabControlState({
    required RequestState state,
    required String message,
    required int tabIndex,
  }) = _TabControlState;
  factory TabControlState.initial() => const TabControlState(
      state: RequestState.empty, message: '', tabIndex: 1);
}
