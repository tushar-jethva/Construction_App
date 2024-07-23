import 'dart:convert';

import 'package:construction_mate/core/constants/api.dart';
import 'package:http/http.dart' as http;

import 'package:construction_mate/logic/models/floor_site_model.dart';

abstract class SiteProgressDataSource {
  Future<List<FloorSiteModel>> getFloorsOfSite(
      {required String projectId, required String buildingId});

  Future<void> siteProgressUpdateAgency(
      {required String projectId,
      required String buildingId,
      required List<String> workTypeIds,
      required String floorIndex});
}

class SiteProgressDataSourceImpl extends SiteProgressDataSource {
  @override
  Future<List<FloorSiteModel>> getFloorsOfSite(
      {required String projectId, required String buildingId}) async {
    List<FloorSiteModel> floorsOfSiteList = [];
    try {
      http.Response res = await http.post(
        Uri.parse("${API.GET_FLOORS}"),
        body: jsonEncode(
            {"projectId": "$projectId", "buildingId": "$buildingId"}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final floors = jsonDecode(res.body);
      for (var floor in floors["data"]) {
        floorsOfSiteList.add(FloorSiteModel.fromJson(floor));
      }
    } catch (e) {
      print(e.toString());
    }
    return floorsOfSiteList;
  }

  @override
  Future<void> siteProgressUpdateAgency(
      {required String projectId,
      required String buildingId,
      required List<String> workTypeIds,
      required String floorIndex}) async {
    try {
      http.Response res = await http.post(
        Uri.parse("${API.SITE_PROGRESS_UPDATE_AGENCY}"),
        body: jsonEncode({
          "ProjectId": projectId,
          "BuildingId": buildingId,
          "WokTypeArray": workTypeIds,
          "floorIndex": floorIndex
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
