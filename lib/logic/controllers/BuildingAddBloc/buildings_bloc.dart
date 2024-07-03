import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:meta/meta.dart';
part 'buildings_event.dart';
part 'buildings_state.dart';

class BuildingsBloc extends Bloc<BuildingsEvent, BuildingsState> {
  BuildingsBloc() : super(BuildingsLoadSuccess(buildings: buildings)) {
    on<LoadBuildings>(_onLoadBuildings);
  }

  void _onLoadBuildings(LoadBuildings event, Emitter<BuildingsState> emit) {
    emit(BuildingsLoadSuccess(buildings: event.buildings));
  }
}
