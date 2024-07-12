import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/building_repository.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:meta/meta.dart';
part 'buildings_event.dart';
part 'buildings_state.dart';

class BuildingsBloc extends Bloc<BuildingsEvent, BuildingsState> {
  final BuildingRepository buildingRepository;
  BuildingsBloc(this.buildingRepository) : super(BuildingsInitial()) {
    on<LoadBuildings>(_onLoadBuildings);
  }

  void _onLoadBuildings(
      LoadBuildings event, Emitter<BuildingsState> emit) async {
    emit(BuildingsInitial());
    try {
      List<BuildingModel> listOfBuildings =
          await buildingRepository.allBuildingById(projectId: event.projectId);
      emit(BuildingsLoadSuccess(buildings: listOfBuildings));
    } catch (e) {}
  }
}
