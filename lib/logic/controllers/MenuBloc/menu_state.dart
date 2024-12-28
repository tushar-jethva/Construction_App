part of 'menu_bloc.dart';

@freezed
class MenuState with _$MenuState {
  const factory MenuState({
    required int index,
  }) = _MenuState;
   factory MenuState.initial() => const MenuState(index: 0);
}
