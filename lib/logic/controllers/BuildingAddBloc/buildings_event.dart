// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'buildings_bloc.dart';

@immutable
sealed class BuildingsEvent {}

class LoadBuildings extends BuildingsEvent {
  final String projectId;
  LoadBuildings({required this.projectId});
}

class AddBuilding extends BuildingsEvent {
  final String buildName;
  final String floors;
  final List<Map<String, String>> floorArray;
  final String description;
  final String projectId;
  AddBuilding({
    required this.buildName,
    required this.floors,
    required this.floorArray,
    required this.description,
    required this.projectId,
  });
}
