part of 'menu_bloc.dart';

@freezed
class MenuEvent with _$MenuEvent {
  const factory MenuEvent.started() = _Started;

  const factory MenuEvent.onIndexChanged({required int index}) =
      _OnIndexChanged;
}
