import 'dart:convert';

import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/floor_model.dart';
import 'package:http/http.dart' as http;

abstract class AgencyDataSource {
  Future<List<AgencyModel>> getAgencyByWorkType({required String workTypeId});

  Future<void> addAgencyInBuilding(
      {required String workTypeId,
      required String agencyId,
      required List<int> floors,
      required double pricePerFeet,
      required String name,
      required String companyId,
      required String buildingId,
      required String projectId,
      required String description});

  Future<List<FloorModel>> getSelectedFloors(
      {required String projectId,
      required String buildingId,
      required String workTypeId});
}

class AgencyDataSourceDataSourceImpl extends AgencyDataSource {
  @override
  Future<List<AgencyModel>> getAgencyByWorkType(
      {required String workTypeId}) async {
    List<AgencyModel> allAgencyByWorkTypeList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("${API.GET_AGENCY_BY_WORK_TYPE}/${workTypeId}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      final agencies = jsonDecode(res.body);
      for (var agency in agencies["data"]) {
        allAgencyByWorkTypeList.add(AgencyModel.fromJson(agency));
      }
    } catch (e) {
      print(e.toString());
    }
    return allAgencyByWorkTypeList;
  }

  @override
  Future<List<FloorModel>> getSelectedFloors(
      {required String projectId,
      required String buildingId,
      required String workTypeId}) async {
    List<FloorModel> floorList = [];
    try {
      print("$projectId $buildingId $workTypeId");
      http.Response res = await http.post(
        Uri.parse(
            "https://constructionmate-backend.onrender.com/Task/GetSelectedFloors"),
        body: jsonEncode({
          "ProjectId": projectId,
          "BuildingId": buildingId,
          "WorkTypeId": workTypeId
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("hello ${res.body}");
      final floors = jsonDecode(res.body);
      for (var floor in floors["data"]) {
        floorList.add(FloorModel.fromJson(floor));
      }
    } catch (e) {
      print(e.toString());
    }
    return floorList;
  }

  @override
  Future<void> addAgencyInBuilding(
      {required String workTypeId,
      required String agencyId,
      required List<int> floors,
      required double pricePerFeet,
      required String name,
      required String companyId,
      required String buildingId,
      required String projectId,
      required String description}) async {
    try {
      http.Response res = await http.post(
        Uri.parse("${API.ADD_TASK_URL}"),
        body: jsonEncode({
          "Name": name,
          "AgencyId": agencyId,
          "CompanyId": companyId,
          "ProjectId": projectId,
          "WorkType": workTypeId,
          "WorkingFloors": floors.map((e) => e.toString()).toList(),
          "Price": pricePerFeet.toString(),
          "Description": description,
          "BuildingId": buildingId
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      print(res.body);
    } catch (e) {
      print(e.toString());
    }
  }
}
