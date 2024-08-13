// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'buildings_bloc.dart';

class BuildingsState {

}

final class BuildingsInitial extends BuildingsState {

}

class BuildingsLoadSuccess extends BuildingsState {
  final List<BuildingModel> buildings;

  BuildingsLoadSuccess({
    required this.buildings,
  });
}

class BuildingAddLoading extends BuildingsState {

}

class BuildingAddSuccess extends BuildingsState {

}

class BuildingAddFailure extends BuildingsState {

}
