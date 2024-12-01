import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/material_model.dart';
import 'package:construction_mate/utilities/dio_config/base_data_center.dart';
import 'package:injectable/injectable.dart';

abstract class MaterialDataSource {
  Future<String> addMaterial({required MaterialModel model});

  Future<List<MaterialModel>> getMaterialList({required String projectId});

  Future<String> updateMaterial({required MaterialModel model});
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
  Future<List<MaterialModel>> getMaterialList(
      {required String projectId}) async {
    try {
      final res = await dio.get("${API.GET_MATERIAL}/$projectId");

      final data = res.data;
      List<MaterialModel> list = [];

      for (var material in data['data']) {
        list.add(MaterialModel.fromMap(material));
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
}
