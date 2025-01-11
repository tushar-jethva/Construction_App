import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'building_by_id_event.dart';
part 'building_by_id_state.dart';
part 'building_by_id_bloc.freezed.dart';

@singleton
class BuildingByIdBloc extends Bloc<BuildingByIdEvent, BuildingByIdState> {
  BuildingByIdBloc() : super(BuildingByIdState.initial()) {
    on<BuildingByIdEvent>((event, emit) {
      event.map(initialize: (_Initialize value) {
        emit(BuildingByIdState.initial());
      }, getProject: (_GetProject value) {
        emit(state.copyWith(project: value.project));
      });
    });
  }
}
