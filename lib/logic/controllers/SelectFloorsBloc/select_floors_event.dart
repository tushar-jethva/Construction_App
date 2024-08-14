// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'select_floors_bloc.dart';

@immutable
abstract class SelectFloorsEvent {}

class AddFloorEvent extends SelectFloorsEvent {
  final String floor;
  AddFloorEvent({required this.floor});
}

class RemoveFloorEvent extends SelectFloorsEvent {
  final String floor;
  RemoveFloorEvent({required this.floor});
}

class FetchSelectedFloorsEvent extends SelectFloorsEvent {
  final String projectId;
  final String buildingId;
  final String workTypeId;

  FetchSelectedFloorsEvent({required this.projectId, required this.buildingId, required this.workTypeId});
 
}
