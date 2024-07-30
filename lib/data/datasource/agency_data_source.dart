import 'dart:convert';

import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/drop_down_agency_model.dart';
import 'package:construction_mate/logic/models/floor_model.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:construction_mate/logic/models/total_agency_model.dart';
import 'package:http/http.dart' as http;

abstract class AgencyDataSource {
  Future<List<AgencyModel>> getAgencyByWorkType({required String workTypeId});

  Future<List<AgencyModel>> getAgencyByBuildingId({required String buildingId});

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

  Future<List<PerBuildingAgencyModel>> getWorkingAgenciesOnBuilding(
      {required String buildingId, required String projectId});

  Future<List<DropDownAgencyModel>> getWorkingAgenciesOnBuildingForDropDown(
      {required String buildingId, required String projectId});

  Future<List<TotalAgencyModel>> getTotalAgencies();

  Future<List<TotalAgencyModel>> getAgencyByProject(
      {required String projectId});

  Future<void> addAgency(
      {required String name,
      required String description,
      required List<String> workTypeIds});
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
        Uri.parse(API.GET_FLOORS_BY_WORK_TYPE),
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

  @override
  Future<List<AgencyModel>> getAgencyByBuildingId(
      {required String buildingId}) async {
    List<AgencyModel> allAgencyByBuildingIdList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("${API.GET_AGENCY_BY_BUILDING_ID}/${buildingId}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      final agencies = jsonDecode(res.body);
      for (var agency in agencies["data"]) {
        allAgencyByBuildingIdList.add(AgencyModel.fromJson(agency));
      }
    } catch (e) {
      print(e.toString());
    }
    return allAgencyByBuildingIdList;
  }

  @override
  Future<List<PerBuildingAgencyModel>> getWorkingAgenciesOnBuilding(
      {required String buildingId, required String projectId}) async {
    List<PerBuildingAgencyModel> allAgencyWorkingInBuildingIdList = [];
    try {
      http.Response res = await http.post(
        Uri.parse("${API.GET_AGENCY_WORKING_IN_BUILDING_ID}"),
        body: jsonEncode(
            {"ProjectId": "$projectId", "BuildingId": "$buildingId"}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      final agencies = jsonDecode(res.body);
      for (var agency in agencies["data"]) {
        allAgencyWorkingInBuildingIdList
            .add(PerBuildingAgencyModel.fromMap(agency));
      }
    } catch (e) {
      print(e.toString());
    }
    return allAgencyWorkingInBuildingIdList;
  }

  @override
  Future<List<DropDownAgencyModel>> getWorkingAgenciesOnBuildingForDropDown(
      {required String buildingId, required String projectId}) async {
    List<DropDownAgencyModel> allAgencyWorkingInBuildingIdList = [];
    try {
      http.Response res = await http.post(
        Uri.parse("${API.GET_AGENCY_FOR_DROPDOWN}"),
        body: jsonEncode(
            {"ProjectId": "$projectId", "BuildingId": "$buildingId"}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      final agencies = jsonDecode(res.body);
      for (var agency in agencies["data"]) {
        allAgencyWorkingInBuildingIdList
            .add(DropDownAgencyModel.fromJson(agency));
      }
    } catch (e) {
      print(e.toString());
    }
    return allAgencyWorkingInBuildingIdList;
  }

  @override
  Future<List<TotalAgencyModel>> getTotalAgencies() async {
    List<TotalAgencyModel> totalAgenciesList = [];
    try {
      http.Response res = await http.get(
        Uri.parse("${API.GET_TOTAL_AGENCIES}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      final agencies = jsonDecode(res.body);
      for (var agency in agencies["data"]) {
        totalAgenciesList.add(TotalAgencyModel.fromJson(agency));
      }
    } catch (e) {
      print(e.toString());
    }
    return totalAgenciesList;
  }

  @override
  Future<List<TotalAgencyModel>> getAgencyByProject(
      {required String projectId}) async {
    List<TotalAgencyModel> totalAgenciesList = [];
    try {
      http.Response res = await http.post(
        Uri.parse("${API.GET_AGENCY_BY_PROJECT}"),
        body: jsonEncode({"ProjectId": projectId}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print(res.body);
      final agencies = jsonDecode(res.body);
      for (var agency in agencies["data"]) {
        totalAgenciesList.add(TotalAgencyModel.fromJson(agency));
      }
    } catch (e) {
      print(e.toString());
    }
    return totalAgenciesList;
  }

  @override
  Future<void> addAgency(
      {required String name,
      required String description,
      required List<String> workTypeIds}) async {
    try {
      http.Response res = await http.post(
        Uri.parse("${API.ADD_AGENCY}"),
        body: jsonEncode({
          "Name": name,
          "Description": description,
          "WorkType": workTypeIds
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
