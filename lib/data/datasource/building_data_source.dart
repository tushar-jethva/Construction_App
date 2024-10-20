import 'dart:convert';
import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:http/http.dart' as http;

abstract class BuildingDataSource {
  Future<void> addBuilding(
      {required String buildingName,
      required String floors,
      required List<Map<String, String>> floorArray,
      required String description,
      required String projectId});

  Future<List<BuildingModel>> allBuildingById({required String projectId});
}

class BuildingDataSourceImpl extends BuildingDataSource {
  @override
  Future<void> addBuilding(
      {required String buildingName,
      required String floors,
      required List<Map<String, dynamic>> floorArray,
      required String description,
      required String projectId}) async {
    try {
      print("floorArray $floorArray");
      await http.post(
        Uri.parse(API.ADD_BUILDING_URL),
        body: jsonEncode({
          'Name': buildingName,
          'Description': description,
          'TotalFloor': floors,
          'ProjectId': projectId,
          'floorArray': floorArray
        }),
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
      print(res.body);
      final buildings = jsonDecode(res.body);
      for (var building in buildings["data"]) {
        print(building);
        listOfBuildings.add(BuildingModel.fromJson(building));
        print(listOfBuildings);
      }
      print(listOfBuildings);
    } catch (e) {}
    return listOfBuildings;
  }
}
