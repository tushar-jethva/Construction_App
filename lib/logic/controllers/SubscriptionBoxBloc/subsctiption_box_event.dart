part of 'subsctiption_box_bloc.dart';

@freezed
class SubsctiptionBoxEvent with _$SubsctiptionBoxEvent {
  //initialize
  const factory SubsctiptionBoxEvent.initialize() = _Initialize;

  //change selection
  const factory SubsctiptionBoxEvent.onSelectionChanged({required int index}) = _OnSelectionChanged;
}
