part of 'material_by_partie_bloc.dart';

@freezed
class MaterialByPartieState with _$MaterialByPartieState {
  const factory MaterialByPartieState({
    required RequestState state,
    required String message,
    required List<GetMaterialModel> listOfMaterial,
  }) = _MaterialByPartieState;
  factory MaterialByPartieState.initial() => const MaterialByPartieState(
      state: RequestState.empty, message: '', listOfMaterial: []);
}
