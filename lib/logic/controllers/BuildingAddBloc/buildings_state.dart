part of 'buildings_bloc.dart';

@immutable
sealed class BuildingsState {}

final class BuildingsInitial extends BuildingsState {}

class BuildingsLoadSuccess extends BuildingsState {
  final List<BuildingModel> buildings;

  BuildingsLoadSuccess({required this.buildings});
}
