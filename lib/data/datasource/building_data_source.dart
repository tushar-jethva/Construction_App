import 'dart:convert';
import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/utilities/dio_config/base_data_center.dart';
import 'package:injectable/injectable.dart';

abstract class BuildingDataSource {
  Future<void> addBuilding(
      {required String buildingName,
      required String floors,
      required List<Map<String, String>> floorArray,
      required String description,
      required String projectId});

  Future<List<BuildingModel>> allBuildingById({required String projectId});
}

@LazySingleton(as: BuildingDataSource)
class BuildingDataSourceImpl extends BuildingDataSource {
  final dio = BaseDataCenter().dio.dio;

  @override
  Future<void> addBuilding(
      {required String buildingName,
      required String floors,
      required List<Map<String, dynamic>> floorArray,
      required String description,
      required String projectId}) async {
    try {
      print("floorArray $floorArray");
      final res = await dio.post(
        API.ADD_BUILDING_URL,
        data: jsonEncode({
          'Name': buildingName,
          'Description': description,
          'TotalFloor': floors,
          'ProjectId': projectId,
          'floorArray': floorArray
        }),
      );

      print("-------------- addbuilding ${res.data} ---------------");
    } catch (e) {}
  }

  @override
  Future<List<BuildingModel>> allBuildingById(
      {required String projectId}) async {
    List<BuildingModel> listOfBuildings = [];
    try {
      final res = await dio.get("${API.GET_BUILDING_BY_ID_URL}/$projectId");
      final buildings = res.data;

      print("--------------- buildings ${res.data} ----------------");
      for (var building in buildings["data"]) {
        listOfBuildings.add(BuildingModel.fromJson(building));
      }
    } catch (e) {}
    return listOfBuildings;
  }
}
