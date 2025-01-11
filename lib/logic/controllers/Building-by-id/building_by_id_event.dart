part of 'building_by_id_bloc.dart';

@freezed
class BuildingByIdEvent with _$BuildingByIdEvent {
  //Initialize
  const factory BuildingByIdEvent.initialize() = _Initialize;

  //Fetch building by id
  const factory BuildingByIdEvent.getProject({required ProjectModel project}) =
      _GetProject;
}
