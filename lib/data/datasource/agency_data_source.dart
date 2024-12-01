import 'dart:convert';
import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/drop_down_agency_model.dart';
import 'package:construction_mate/logic/models/floor_model.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:construction_mate/logic/models/total_agency_model.dart';
import 'package:construction_mate/utilities/dio_config/api_service.dart';
import 'package:construction_mate/utilities/dio_config/base_data_center.dart';
import 'package:dio/dio.dart' as dio;

abstract class AgencyDataSource {
  Future<List<AgencyModel>> getAgencyByWorkType({required String workTypeId});

  Future<List<AgencyModel>> getAgencyByBuildingId({required String buildingId});

  Future<void> addAgencyInBuilding(
      {required String workTypeId,
      required String agencyId,
      required List<String> floors,
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

  Future<List<DropDownAgencyModel>> getPaymentInAgency();
}

class AgencyDataSourceDataSourceImpl extends AgencyDataSource {
  final dio = BaseDataCenter().dio.dio;

  @override
  Future<List<AgencyModel>> getAgencyByWorkType(
      {required String workTypeId}) async {
    try {
      List<AgencyModel> allAgencyByWorkTypeList = [];

      print("AgencyWorkTypee");
      final res = await dio.get(
        "${API.GET_AGENCY_BY_WORK_TYPE}/$workTypeId",
      );
      print(res.data);
      final agencies = res.data;
      for (var agency in agencies["data"]) {
        allAgencyByWorkTypeList.add(AgencyModel.fromJson(agency));
      }
      return allAgencyByWorkTypeList;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<FloorModel>> getSelectedFloors(
      {required String projectId,
      required String buildingId,
      required String workTypeId}) async {
    List<FloorModel> floorList = [];
    try {
      print("$projectId $buildingId $workTypeId");
      final res = await dio.post(
        API.GET_FLOORS_BY_WORK_TYPE,
        data: jsonEncode({
          "ProjectId": projectId,
          "BuildingId": buildingId,
          "WorkTypeId": workTypeId
        }),
      );
      print("hello ${res.data}");
      final floors = res.data;
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
      required List<String> floors,
      required double pricePerFeet,
      required String name,
      required String companyId,
      required String buildingId,
      required String projectId,
      required String description}) async {
    try {
      print(floors);
      final res = await dio.post(
        "${API.ADD_TASK_URL}",
        data: jsonEncode({
          "Name": name,
          "AgencyId": agencyId,
          "ProjectId": projectId,
          "WorkType": workTypeId,
          "WorkingFloors": floors,
          "Price": pricePerFeet.toString(),
          "Description": description,
          "BuildingId": buildingId
        }),
      );

      print(res.data);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<AgencyModel>> getAgencyByBuildingId(
      {required String buildingId}) async {
    List<AgencyModel> allAgencyByBuildingIdList = [];
    try {
      final res =
          await dio.get("${API.GET_AGENCY_BY_BUILDING_ID}/${buildingId}");

      final agencies = res.data;
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
      final res = await dio.post("${API.GET_AGENCY_WORKING_IN_BUILDING_ID}",
          data: jsonEncode(
              {"ProjectId": "$projectId", "BuildingId": "$buildingId"}));

      final agencies = res.data;
      print("newage: ${res.data}");
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
      final res = await dio.post(
        "${API.GET_AGENCY_FOR_DROPDOWN}",
        data: jsonEncode(
            {"ProjectId": "$projectId", "BuildingId": "$buildingId"}),
      );

      final agencies = res.data;
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
      final res = await dio.get("${API.GET_TOTAL_AGENCIES}");

      print(res.data);
      final agencies = res.data;
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
      final res = await dio.post(
        "${API.GET_AGENCY_BY_PROJECT}",
        data: jsonEncode({"ProjectId": projectId}),
      );
      print(res.data);
      final agencies = res.data;
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
      await dio.post(
        "${API.ADD_AGENCY}",
        data: jsonEncode({
          "Name": name,
          "Description": description,
          "WorkType": workTypeIds
        }),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<DropDownAgencyModel>> getPaymentInAgency() async {
    List<DropDownAgencyModel> listOfPayInAgency = [];
    try {
      final res = await dio.get("${API.GET_PAYMENT_IN_AGENCY}");

      final agencies = res.data;
      for (var agency in agencies["data"]) {
        listOfPayInAgency.add(DropDownAgencyModel.fromJson(agency));
      }
    } catch (e) {
      print(e.toString());
    }
    return listOfPayInAgency;
  }
}
