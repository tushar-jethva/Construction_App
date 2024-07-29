import 'dart:convert';

import 'package:construction_mate/core/constants/api.dart';
import 'package:http/http.dart' as http;
import 'package:construction_mate/logic/models/work_type_model.dart';

abstract class WorkTypesDataSource {
  Future<List<WorkTypeModel>> getAllWorkTypes();
  Future<String> addWorkType({required String workTypeName});
}

class WorkTypesDataSourceImpl extends WorkTypesDataSource {
  @override
  Future<List<WorkTypeModel>> getAllWorkTypes() async {
    List<WorkTypeModel> allWorkTypeList = [];
    try {
      http.Response res = await http.get(
        Uri.parse(API.GET_ALL_WORK_TYPES),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      final workTypes = jsonDecode(res.body);
      for (var workType in workTypes["data"]) {
        allWorkTypeList.add(WorkTypeModel.fromJson(workType));
      }
    } catch (e) {
      print(e.toString());
    }
    return allWorkTypeList;
  }

  @override
  Future<String> addWorkType({required String workTypeName}) async{
    String strRes = "";
    try{
      http.Response res = await http.post(
        Uri.parse(API.ADD_WORK_TYPE),
        body: jsonEncode({
          "Name" : workTypeName.toUpperCase()
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      final map = jsonDecode(res.body);
      strRes = map["message"];
    }
    catch(e){
      print(e.toString());
      
    }
    return strRes;
  }
}
