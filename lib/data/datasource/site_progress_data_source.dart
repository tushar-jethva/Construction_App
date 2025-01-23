import 'dart:convert';

import 'package:construction_mate/core/constants/api.dart';

import 'package:construction_mate/logic/models/floor_site_model.dart';
import 'package:construction_mate/utilities/dio_config/base_data_center.dart';
import 'package:flutter/material.dart';

abstract class SiteProgressDataSource {
  Future<List<FloorSiteModel>> getFloorsOfSite(
      {required String projectId, required String buildingId});

  Future<FloorSiteModel> getFloorOfSiteByFloorIndex(
      {required String projectId,
      required String buildingId,
      required String floorIndex});

  Future<void> siteProgressUpdateAgency(
      {required String projectId,
      required String buildingId,
      required List<String> workTypeIds,
      required String floorIndex});
}

class SiteProgressDataSourceImpl extends SiteProgressDataSource {
  final dio = BaseDataCenter().dio.dio;

  @override
  Future<List<FloorSiteModel>> getFloorsOfSite(
      {required String projectId, required String buildingId}) async {
    List<FloorSiteModel> floorsOfSiteList = [];
    try {
      final res = await dio.post(
        API.GET_FLOORS,
        data: jsonEncode({"projectId": projectId, "buildingId": buildingId}),
      );
      final floors = res.data;
      print("----------------- getfloorsapi    ${floors} ---------------");
      for (var floor in floors["data"]) {
        floorsOfSiteList.add(FloorSiteModel.fromJson(floor));
      }
    } catch (e) {
      print(e.toString());
    }
    return floorsOfSiteList;
  }

  @override
  Future<FloorSiteModel> getFloorOfSiteByFloorIndex(
      {required String projectId,
      required String buildingId,
      required String floorIndex}) async {
    FloorSiteModel floorsOfSite = FloorSiteModel();
    try {
      print("$projectId $buildingId");
      print(floorIndex);
      final res = await dio.post(
        "${API.GET_FLOOR_BY_FLOOR_INDEX}",
        data: jsonEncode({
          "projectId": projectId,
          "buildingId": buildingId,
          "floorName": floorIndex
        }),
      );

      print("Floorofsite ${res.data}");
      final floors = res.data;
      floorsOfSite = FloorSiteModel.fromJson(floors["data"][0]);

      print(
          "--------------- floor ${floorsOfSite.workStatus?.first.agencyName}");
    } catch (e) {
      print(e.toString());
    }
    return floorsOfSite;
  }

  @override
  Future<void> siteProgressUpdateAgency(
      {required String projectId,
      required String buildingId,
      required List<String> workTypeIds,
      required String floorIndex}) async {
    try {
      print("$projectId $buildingId $floorIndex $workTypeIds");
      final res = await dio.post(
        API.SITE_PROGRESS_UPDATE_AGENCY,
        data: jsonEncode({
          "ProjectId": projectId,
          "BuildingId": buildingId,
          "WokTypeArray": workTypeIds,
          "floorName": floorIndex
        }),
      );
      debugPrint("---------- site response ${res.data} ---------------");
    } catch (e) {
      print(e.toString());
    }
  }
}
