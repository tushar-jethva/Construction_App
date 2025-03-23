part of 'material_partie_project_bloc.dart';

@freezed
class MaterialPartieProjectEvent with _$MaterialPartieProjectEvent {
  //Initialize
  const factory MaterialPartieProjectEvent.initialize() = _Initialize;

   //Selected agency
  const factory MaterialPartieProjectEvent.onChangeMaterialAgency(
      {required String materialAgency}) = _OnChangeMaterialAgency;

  //fetch material parti by project
  const factory MaterialPartieProjectEvent.fetchMatrialPartieByProject(
      {required String projectId}) = _FetchMatrialPartieByProject;
}
