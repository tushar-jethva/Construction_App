part of 'add_material_bloc.dart';

@freezed
class AddMaterialEvent with _$AddMaterialEvent {
  const factory AddMaterialEvent.initialize() = _Initialize;

  const factory AddMaterialEvent.onUnitChanged({required String unit}) =
      _OnUnitChanged;

  const factory AddMaterialEvent.onDateChanged({required String date}) =
      _onDateChanged;

  //Button
  const factory AddMaterialEvent.onAddMaterialTap({required String projectId,required String materialName,required String quantity, required String description,required bool isUpdate, String? materialId}) =
      _OnAddMaterialTap;

  //Get material list
  const factory AddMaterialEvent.fetchAllMaterial({required String projectId}) = _FetchAllMaterial;

  

} 
