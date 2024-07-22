import 'dart:convert';
import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:http/http.dart' as http;

abstract class BuildingDataSource {
  Future<void> addBuilding(
      {required String buildingName,
      required String floors,
      required String unitPerFloor,
      required String description,
      required String projectId});

  Future<List<BuildingModel>> allBuildingById({required String projectId});
}

class BuildingDataSourceImpl extends BuildingDataSource {
  @override
  Future<void> addBuilding(
      {required String buildingName,
      required String floors,
      required String unitPerFloor,
      required String description,
      required String projectId}) async {
    try {
      BuildingModel building = BuildingModel(
          sId: projectId,
          name: buildingName,
          totalFloor: int.parse(floors),
          unitPerFloor: int.parse(unitPerFloor),
          description: description);
      await http.post(
        Uri.parse(API.ADD_BUILDING_URL),
        body: building.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
    } catch (e) {}
  }

  @override
  Future<List<BuildingModel>> allBuildingById(
      {required String projectId}) async {
    List<BuildingModel> listOfBuildings = [];
    try {
      http.Response res = await http.get(
        Uri.parse("${API.GET_BUILDING_BY_ID_URL}/${projectId}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final buildings = jsonDecode(res.body);
      for (var building in buildings["data"]) {
        listOfBuildings.add(BuildingModel.fromJson(building));
      }
    } catch (e) {}
    return listOfBuildings;
  }
}
