import 'package:construction_mate/data/datasource/building_data_source.dart';
import 'package:construction_mate/logic/models/building_model.dart';

abstract class BuildingRepository {
  Future<void> addBuilding(
      {required String buildingName,
      required String floors,
      required String unitPerFloor,
      required String description,
      required String projectId});

  Future<List<BuildingModel>> allBuildingById({required String projectId});
}

class BuildingRepositoryImpl extends BuildingRepository {
  final BuildingDataSource buildingDataSource;
  BuildingRepositoryImpl(this.buildingDataSource);
  @override
  Future<void> addBuilding(
      {required String buildingName,
      required String floors,
      required String unitPerFloor,
      required String description,
      required String projectId}) async {
    try {
      await buildingDataSource.addBuilding(
          buildingName: buildingName,
          floors: floors,
          unitPerFloor: unitPerFloor,
          description: description,
          projectId: projectId);
    } catch (e) {}
  }

  @override
  Future<List<BuildingModel>> allBuildingById(
      {required String projectId}) async {
    List<BuildingModel> listOfBuildings = [];
    try {
      listOfBuildings =
          await buildingDataSource.allBuildingById(projectId: projectId);
    } catch (e) {}
    return listOfBuildings;
  }
}
