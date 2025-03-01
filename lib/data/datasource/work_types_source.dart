import 'dart:convert';
import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/utilities/dio_config/base_data_center.dart';
import 'package:construction_mate/logic/models/work_type_model.dart';

abstract class WorkTypesDataSource {
  Future<List<WorkTypeModel>> getAllWorkTypes();
  Future<String> addWorkType({required String workTypeName});
}

class WorkTypesDataSourceImpl extends WorkTypesDataSource {
    final dio = BaseDataCenter().dio.dio;

  @override
  Future<List<WorkTypeModel>> getAllWorkTypes() async {
    List<WorkTypeModel> allWorkTypeList = [];
    try {
      final res = await dio.get(
        API.GET_ALL_WORK_TYPES,
      
      );

      final workTypes = res.data;
      for (var workType in workTypes["data"]) {
        allWorkTypeList.add(WorkTypeModel.fromJson(workType));
      }
    } catch (e) {
      print(e.toString());
    }
    return allWorkTypeList;
  }

  @override
  Future<String> addWorkType({required String workTypeName}) async {
    String strRes = "";
    try {
      final res = await dio.post(
        API.ADD_WORK_TYPE,
        data: jsonEncode({"Name": workTypeName.toUpperCase()}),
      
      );

      final map = res.data;
      strRes = map["message"];
    } catch (e) {
      print(e.toString());
    }
    return strRes;
  }
}
