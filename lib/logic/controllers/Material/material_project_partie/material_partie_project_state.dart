part of 'material_partie_project_bloc.dart';

@freezed
class MaterialPartieProjectState with _$MaterialPartieProjectState {
  const factory MaterialPartieProjectState(
          {required RequestState state,
          required String message,
          required String selectedMaterialAgency,
          required List<ProjectPartieModel> listOfMaterialPartie}) =
      _MaterialPartieProjectState;
  factory MaterialPartieProjectState.initial() =>
      const MaterialPartieProjectState(
          state: RequestState.empty,
          message: '',
          listOfMaterialPartie: [],
          selectedMaterialAgency: '');
}
