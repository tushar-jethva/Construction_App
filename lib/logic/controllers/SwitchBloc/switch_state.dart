part of 'switch_bloc.dart';

@freezed
class SwitchState with _$SwitchState {
  const factory SwitchState({required bool isSwitched, required RequestState state}) = _SwitchState;

   factory SwitchState.initial() =>  SwitchState(
        state: RequestState.empty,
        isSwitched: false,
  );
}
