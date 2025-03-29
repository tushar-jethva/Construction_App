import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/material_usecase.dart';
import 'package:construction_mate/logic/models/material/all_material_model.dart';
import 'package:construction_mate/logic/models/project_partie_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'material_partie_project_event.dart';
part 'material_partie_project_state.dart';
part 'material_partie_project_bloc.freezed.dart';

@singleton
class MaterialPartieProjectBloc
    extends Bloc<MaterialPartieProjectEvent, MaterialPartieProjectState> {
  MaterialPartieProjectBloc(this.materialUsecase)
      : super(MaterialPartieProjectState.initial()) {
    on<MaterialPartieProjectEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize value) {
          emit(MaterialPartieProjectState.initial());
        },
        onPartieIndexChanged: (value) {
          emit(state.copyWith(
              state: RequestState.empty, partieIndex: value.partieIndex));
        },
        onProductIndexChanged: (value) {
          emit(state.copyWith(
              state: RequestState.empty, productIndex: value.productIndex));
        },
        onChangeMaterialAgency: (value) {},
        fetchMatrialPartieByProject:
            (_FetchMatrialPartieByProject value) async {
          emit(state.copyWith(state: RequestState.loading));

          final res = await materialUsecase.getMaterialPartyByProject(
              projectId: value.projectId);

          res.fold(
            (l) {
              emit(state.copyWith(
                  state: RequestState.error, message: l.message));
            },
            (r) {
              emit(
                state.copyWith(
                    state: RequestState.loaded,
                    materialData: r,
                    listOfMaterialParty: r.data ?? []),
              );
            },
          );
        },
      );
    });
  }

  final MaterialUsecase materialUsecase;
}
