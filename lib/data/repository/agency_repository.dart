import 'package:construction_mate/data/datasource/agency_data_source.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/drop_down_agency_model.dart';
import 'package:construction_mate/logic/models/floor_model.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:construction_mate/logic/models/total_agency_model.dart';

abstract class AgencyRepository {
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
}

class AgencyRepositoryImpl extends AgencyRepository {
  final AgencyDataSource agencyDataSource;

  AgencyRepositoryImpl({required this.agencyDataSource});

  @override
  Future<List<AgencyModel>> getAgencyByWorkType(
      {required String workTypeId}) async {
    List<AgencyModel> allAgencyByWorkTypeList = [];
    try {
      allAgencyByWorkTypeList =
          await agencyDataSource.getAgencyByWorkType(workTypeId: workTypeId);
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
      floorList = await agencyDataSource.getSelectedFloors(
          projectId: projectId, buildingId: buildingId, workTypeId: workTypeId);
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
      await agencyDataSource.addAgencyInBuilding(
          workTypeId: workTypeId,
          agencyId: agencyId,
          floors: floors,
          pricePerFeet: pricePerFeet,
          name: name,
          companyId: companyId,
          buildingId: buildingId,
          projectId: projectId,
          description: description);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<AgencyModel>> getAgencyByBuildingId({required buildingId}) async {
    List<AgencyModel> allAgencyByBuildingIdList = [];
    try {
      allAgencyByBuildingIdList =
          await agencyDataSource.getAgencyByBuildingId(buildingId: buildingId);
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
      allAgencyWorkingInBuildingIdList =
          await agencyDataSource.getWorkingAgenciesOnBuilding(
              buildingId: buildingId, projectId: projectId);
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
      allAgencyWorkingInBuildingIdList =
          await agencyDataSource.getWorkingAgenciesOnBuildingForDropDown(
              buildingId: buildingId, projectId: projectId);
    } catch (e) {
      print(e.toString());
    }
    return allAgencyWorkingInBuildingIdList;
  }

  @override
  Future<List<TotalAgencyModel>> getTotalAgencies() async {
    List<TotalAgencyModel> totalAgenciesList = [];
    try {
      totalAgenciesList = await agencyDataSource.getTotalAgencies();
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
      totalAgenciesList =
          await agencyDataSource.getAgencyByProject(projectId: projectId);
    } catch (e) {
      print(e.toString());
    }
    return totalAgenciesList;
  }
}
