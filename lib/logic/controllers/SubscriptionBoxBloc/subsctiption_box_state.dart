part of 'subsctiption_box_bloc.dart';

@freezed
class SubsctiptionBoxState with _$SubsctiptionBoxState {
  factory SubsctiptionBoxState({required int index}) = _SubsctiptionBoxState;

  factory SubsctiptionBoxState.initial() => SubsctiptionBoxState(index: 1);
}
