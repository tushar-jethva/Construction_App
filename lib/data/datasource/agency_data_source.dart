import 'dart:convert';
import 'dart:ffi';

import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:http/http.dart' as http;
import 'package:construction_mate/logic/models/work_type_model.dart';

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

      print(res.body);
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
        Uri.parse("${API.GET_FLOORS_BY_WORK_TYPE}"),
        body: jsonEncode({
          "Name": name,
          "AgencyId": agencyId,
          "CompanyId": companyId,
          "ProjectId": projectId,
          "WorkType": workTypeId,
          "WorkingFloors": floors,
          "Price": pricePerFeet,
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
