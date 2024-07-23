import 'dart:convert';

import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/data/datasource/site_progress_data_source.dart';
import 'package:http/http.dart' as http;

import 'package:construction_mate/logic/models/floor_site_model.dart';

abstract class SiteProgressRepository {
  Future<List<FloorSiteModel>> getFloorsOfSite(
      {required String projectId, required String buildingId});

  Future<void> siteProgressUpdateAgency(
      {required String projectId,
      required String buildingId,
      required List<String> workTypeIds,
      required String floorIndex});
}

class SiteProgressRepositoryImpl extends SiteProgressRepository {
  final SiteProgressDataSource siteProgressDataSource;

  SiteProgressRepositoryImpl({required this.siteProgressDataSource});
  @override
  Future<List<FloorSiteModel>> getFloorsOfSite(
      {required String projectId, required String buildingId}) async {
    List<FloorSiteModel> floorsOfSiteList = [];
    try {
      floorsOfSiteList = await siteProgressDataSource.getFloorsOfSite(
          projectId: projectId, buildingId: buildingId);
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
      siteProgressDataSource.siteProgressUpdateAgency(
          projectId: projectId,
          buildingId: buildingId,
          workTypeIds: workTypeIds,
          floorIndex: floorIndex);
    } catch (e) {
      print(e.toString());
    }
  }
}
