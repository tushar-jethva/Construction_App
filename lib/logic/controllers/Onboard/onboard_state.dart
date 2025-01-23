part of 'onboard_bloc.dart';

@freezed
class OnboardState with _$OnboardState {
  const factory OnboardState({required int index}) = _OnboardState;
  factory OnboardState.initial() => const OnboardState(index: 0);
}
