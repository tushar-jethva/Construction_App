part of 'onboard_bloc.dart';

@freezed
class OnboardEvent with _$OnboardEvent {
  //Initialize
  const factory OnboardEvent.started() = _Started;

  //On index change
  const factory OnboardEvent.onIndexChanged({required int index}) =
      _OnIndexChanged;
}
