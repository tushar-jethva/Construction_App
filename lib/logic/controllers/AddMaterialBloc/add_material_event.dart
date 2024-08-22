part of 'add_material_bloc.dart';

class AddMaterialEvent {}

class OnProjectValueChangedEvent extends AddMaterialEvent {
  final String projectId;
  OnProjectValueChangedEvent({required this.projectId});
}
