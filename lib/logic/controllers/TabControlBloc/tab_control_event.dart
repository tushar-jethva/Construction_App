part of 'tab_control_bloc.dart';

@freezed
class TabControlEvent with _$TabControlEvent {
  //Initialize
  const factory TabControlEvent.started() = _Started;

  //tab index changed
  const factory TabControlEvent.tabIndexChanged({required int index}) =
      _TabIndexChanged;
}
