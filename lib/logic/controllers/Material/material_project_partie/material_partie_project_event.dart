part of 'material_partie_project_bloc.dart';

@freezed
class MaterialPartieProjectEvent with _$MaterialPartieProjectEvent {
  //Initialize
  const factory MaterialPartieProjectEvent.initialize() = _Initialize;

  //search query change
  const factory MaterialPartieProjectEvent.onSearchQueryChanged(
      {required String searchQuery}) = _OnSearchQueryChanged;

  //material search list change
  const factory MaterialPartieProjectEvent.onMaterialSearchListChange(
      {required List<Rentals> listOfMaterialSearch}) = _OnMaterialSearchListChange;

  //partie index
  const factory MaterialPartieProjectEvent.onPartieIndexChanged(
      {required int partieIndex}) = _OnPartieIndexChanged;

  //project index
  const factory MaterialPartieProjectEvent.onProductIndexChanged(
      {required int productIndex}) = _OnProductIndexChanged;

  //Selected agency
  const factory MaterialPartieProjectEvent.onChangeMaterialAgency(
      {required String materialAgency}) = _OnChangeMaterialAgency;

  //fetch material parti by project
  const factory MaterialPartieProjectEvent.fetchMatrialPartieByProject(
      {required String projectId}) = _FetchMatrialPartieByProject;
}
