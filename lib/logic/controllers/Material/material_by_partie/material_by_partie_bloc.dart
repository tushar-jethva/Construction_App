import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/material_usecase.dart';
import 'package:construction_mate/logic/models/get_material_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'material_by_partie_event.dart';
part 'material_by_partie_state.dart';
part 'material_by_partie_bloc.freezed.dart';

@singleton
class MaterialByPartieBloc
    extends Bloc<MaterialByPartieEvent, MaterialByPartieState> {
  MaterialByPartieBloc(this.materialUsecase)
      : super(MaterialByPartieState.initial()) {
    on<MaterialByPartieEvent>((event, emit) async {
      await event.map(started: (_Started value) {
        emit(MaterialByPartieState.initial());
      }, getMaterialByPartie: (_GetMaterialByPartie value) async {
        emit(state.copyWith(state: RequestState.loading));
        final res =
            await materialUsecase.getMaterialByPartie(partieId: value.partieId);

        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) async {
          emit(state.copyWith(state: RequestState.loaded, listOfMaterial: r));
        });
      });
    });
  }

  final MaterialUsecase materialUsecase;
}
