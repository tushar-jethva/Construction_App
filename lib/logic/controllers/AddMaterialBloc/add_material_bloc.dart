import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/material_repository.dart';
import 'package:construction_mate/logic/models/material_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'add_material_event.dart';
part 'add_material_state.dart';
part 'add_material_bloc.freezed.dart';

@singleton
class AddMaterialBloc extends Bloc<AddMaterialEvent, AddMaterialState> {
  AddMaterialBloc(this.materialRepository) : super(AddMaterialState.initial()) {
    on<AddMaterialEvent>((event, emit) async {
      await event.map(initialize: (_Initialize value) {
        emit(
          AddMaterialState.initial(),
        );
      }, onUnitChanged: (_OnUnitChanged value) {
        emit(state.copyWith(unit: value.unit, state: RequestState.empty));
      }, onDateChanged: (_onDateChanged value) {
        emit(state.copyWith(date: value.date, state: RequestState.empty));
      }, onAddMaterialTap: (_OnAddMaterialTap value) async {
        emit(state.copyWith(state: RequestState.loading));
        MaterialModel model = MaterialModel(
            materialName: value.materialName,
            quantity: value.quantity,
            unit: state.unit,
            description: value.description,
            date: state.date,
            projectId: value.projectId,
            id: value.materialId);
        final res = value.isUpdate == false
            ? await materialRepository.addMaterial(model: model)
            : await materialRepository.updateMaterial(model: model);

        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) {
          emit(state.copyWith(state: RequestState.loaded, message: r));
        });
      }, fetchAllMaterial: (_FetchAllMaterial value) async {
        emit(state.copyWith(state: RequestState.loading));
        final res = await materialRepository.getMaterialList(
            projectId: value.projectId);

        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) {
          emit(state.copyWith(state: RequestState.loaded, materialList: r));
        });
      });
    });
  }

  final MaterialRepository materialRepository;
}
