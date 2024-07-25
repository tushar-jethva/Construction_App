import 'package:construction_mate/data/datasource/site_progress_data_source.dart';

import 'package:construction_mate/logic/models/floor_site_model.dart';

abstract class SiteProgressRepository {
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

      floorsOfSiteList.sort((a, b) => a.floorIndex!.compareTo(b.floorIndex!));
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
      floorsOfSite = await siteProgressDataSource.getFloorOfSiteByFloorIndex(
          projectId: projectId, buildingId: buildingId, floorIndex: floorIndex);
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
