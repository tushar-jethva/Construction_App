import 'package:construction_mate/data/datasource/work_types_source.dart';
import 'package:construction_mate/logic/models/work_type_model.dart';

abstract class WorkTypesRepository {
  Future<List<WorkTypeModel>> getAllWorkTypes();
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
}
