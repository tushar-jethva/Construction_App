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
    on<AddBuilding>(_onBuildingAdd);
  }

  void _onLoadBuildings(
      LoadBuildings event, Emitter<BuildingsState> emit) async {
    emit(BuildingsInitial());
    try {
      List<BuildingModel> listOfBuildings =
          await buildingRepository.allBuildingById(projectId: event.projectId);
      
      emit(BuildingsLoadSuccess(
        buildings: listOfBuildings,
      ));
    } catch (e) {}
  }

  void _onBuildingAdd(AddBuilding event, Emitter<BuildingsState> emit) async {
    try {
      emit(BuildingAddLoading());
      await buildingRepository.addBuilding(
          buildingName: event.buildName,
          floors: event.floors,
          floorArray: event.floorArray,
          description: event.description,
          projectId: event.projectId);
      emit(BuildingAddSuccess());
      add(LoadBuildings(projectId: event.projectId));
    } catch (e) {
      emit(BuildingAddFailure());
    }
  }
}
