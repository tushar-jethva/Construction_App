part of 'buildings_bloc.dart';

@immutable
sealed class BuildingsEvent {}

class LoadBuildings extends BuildingsEvent {
  final List<BuildingModel> buildings;

  LoadBuildings({required this.buildings});
}
