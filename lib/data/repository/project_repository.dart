
import 'package:construction_mate/data/datasource/project_data_source.dart';
import 'package:construction_mate/logic/models/project_model.dart';

abstract class ProjectRepository{
  Future<void> addProject({required String projectName, required String address, required String description});
  Future<List<ProjectModel>> allProjects();
} 
class ProjectRepositoryImpl extends ProjectRepository{
  ProjectRepositoryImpl(this.projectDataSource);
  final ProjectDataSource projectDataSource;
 @override
  Future<void> addProject({required String projectName, required String address, required String description}) async{
    try{
      await projectDataSource.addProject(projectName: projectName, address: address, description: description);
    }
    catch(e){}
  }

  @override
  Future<List<ProjectModel>> allProjects() async{
    List<ProjectModel> allProjectList = [];
    try{
      allProjectList = await projectDataSource.allProjects();
    }
    catch(e){}
    return allProjectList;
  }
}