import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/get_material_model.dart';
import 'package:construction_mate/logic/models/material/all_material_model.dart';
import 'package:construction_mate/logic/models/material/material_model.dart';
import 'package:construction_mate/logic/models/project_partie_model.dart';
import 'package:construction_mate/utilities/dio_config/base_data_center.dart';
import 'package:injectable/injectable.dart';

abstract class MaterialDataSource {
  Future<String> addMaterial({required MaterialModel model});

  Future<List<GetMaterialModel>> getMaterialList({required String projectId});

  Future<String> updateMaterial({required MaterialModel model});

  Future<List<GetMaterialModel>> getMaterialByPartie(
      {required String partieId});

  Future<AllMaterialModel> getMaterialPartyByProject(
      {required String projectId});
}

@LazySingleton(as: MaterialDataSource)
class MaterialDataSourceImpl extends MaterialDataSource {
  final dio = BaseDataCenter().dio.dio;

  @override
  Future<String> addMaterial({required MaterialModel model}) async {
    try {
      final res = await dio.post(API.ADD_MATERIAL, data: model.toJson());
      return "Material added successfully!";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<GetMaterialModel>> getMaterialList(
      {required String projectId}) async {
    try {
      final res = await dio.get("${API.GET_MATERIAL}/$projectId");

      final data = res.data;
      List<GetMaterialModel> list = [];

      for (var material in data['data']) {
        list.add(GetMaterialModel.fromJson(material));
      }

      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> updateMaterial({required MaterialModel model}) async {
    try {
      print("--------------- ${model.id} -------------------------");
      final res = await dio.put("${API.UPDATE_MATERIAL}/${model.id}",
          data: model.toJson());
      print("--------------------- ${res.data} ------------------");

      return "Material updated successfully!";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<GetMaterialModel>> getMaterialByPartie(
      {required String partieId}) async {
    try {
      final res = await dio.get("${API.GET_MATERIAL_BY_PARTIE}/$partieId");

      final data = res.data;
      List<GetMaterialModel> list = [];

      for (var material in data['data']) {
        list.add(GetMaterialModel.fromJson(material));
      }

      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AllMaterialModel> getMaterialPartyByProject(
      {required String projectId}) async {
    try {
      final res = await dio.get("${API.MATERIAL_PARTIE_BY_PROJECT}/$projectId");

      final data = res.data;

      print("=============== material ${data['data']} ==============");

      return AllMaterialModel.fromJson(data);
    } catch (e) {
      rethrow;
    }
  }
}
