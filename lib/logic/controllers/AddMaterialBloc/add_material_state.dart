// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_material_bloc.dart';

@freezed
class AddMaterialState with _$AddMaterialState {
  factory AddMaterialState(
      {required RequestState state,
      required String message,
      required String projectId,
      required String materialName,
      required String quantity,
      required String description,
      required String unit,
      required String date,
      required List<MaterialModel> materialList,
      required bool isUpdate}) = _AddMaterialState;

  factory AddMaterialState.initial() => AddMaterialState(
      state: RequestState.empty,
      message: "",
      projectId: "",
      materialName: "",
      quantity: "",
      unit: "",
      description: "",
      date: DateTime.now().toString(),
      materialList: [],
      isUpdate:false);
}
