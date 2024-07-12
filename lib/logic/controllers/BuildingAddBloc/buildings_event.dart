part of 'buildings_bloc.dart';

@immutable
sealed class BuildingsEvent {}

class LoadBuildings extends BuildingsEvent {
  final String projectId;
  LoadBuildings({required this.projectId});
}
