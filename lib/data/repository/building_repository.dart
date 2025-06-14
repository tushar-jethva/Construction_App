import 'package:construction_mate/data/datasource/building_data_source.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:injectable/injectable.dart';

abstract class BuildingRepository {
  Future<void> addBuilding(
      {required String buildingName,
      required String floors,
      required List<Map<String, String>> floorArray,
      required String description,
      required String projectId});

  Future<List<BuildingModel>> allBuildingById({required String projectId});
}

@LazySingleton(as: BuildingRepository)
class BuildingRepositoryImpl extends BuildingRepository {
  final BuildingDataSource buildingDataSource;
  BuildingRepositoryImpl(this.buildingDataSource);
  @override
  Future<void> addBuilding(
      {required String buildingName,
      required String floors,
      required List<Map<String, String>> floorArray,
      required String description,
      required String projectId}) async {
    try {
      await buildingDataSource.addBuilding(
          buildingName: buildingName,
          floors: floors,
          floorArray: floorArray,
          description: description,
          projectId: projectId);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<BuildingModel>> allBuildingById(
      {required String projectId}) async {
    List<BuildingModel> listOfBuildings = [];
    try {
      listOfBuildings =
          await buildingDataSource.allBuildingById(projectId: projectId);
      print(listOfBuildings);
    } catch (e) {
      print(e.toString());
    }
    return listOfBuildings;
  }
}
