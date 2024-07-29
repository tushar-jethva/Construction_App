import 'package:construction_mate/data/datasource/work_types_source.dart';
import 'package:construction_mate/logic/models/work_type_model.dart';

abstract class WorkTypesRepository {
  Future<List<WorkTypeModel>> getAllWorkTypes();
  Future<String> addWorkType({required String workTypeName});
}

class WorkTypesRepositoryImpl extends WorkTypesRepository {
  final WorkTypesDataSource workTypesDataSource;
  WorkTypesRepositoryImpl(this.workTypesDataSource);
  @override
  Future<List<WorkTypeModel>> getAllWorkTypes() async {
    List<WorkTypeModel> allWorkTypeList = [];
    try {
      allWorkTypeList = await workTypesDataSource.getAllWorkTypes();
    } catch (e) {
      print(e.toString());
    }
    return allWorkTypeList;
  }

  @override
  Future<String> addWorkType({required String workTypeName}) async {
    String strRes = "";
    try {
      strRes =
          await workTypesDataSource.addWorkType(workTypeName: workTypeName);
    } catch (e) {
      print(e.toString());
    }
    return strRes;
  }
}
