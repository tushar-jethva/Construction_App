part of 'select_floors_bloc.dart';

@immutable
sealed class SelectFloorsEvent {}

class AddFloorEvent extends SelectFloorsEvent{
  final int floor;
  AddFloorEvent({required this.floor});
}

class RemoveFloorEvent extends SelectFloorsEvent{
  final int floor;
  RemoveFloorEvent({required this.floor});
}
