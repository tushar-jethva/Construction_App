import 'package:construction_mate/data/datasource/project_data_source.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/utilities/error_handling/error_handler.dart';
import 'package:construction_mate/utilities/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class ProjectRepository {
  Future<Either<Failure, String>> addProject(
      {required String projectName,
      required String address,
      required String description});

  Future<Either<Failure, String>> updateProject(
      {required ProjectModel project});

  Future<List<ProjectModel>> allProjects();
}

@LazySingleton(as: ProjectRepository)
class ProjectRepositoryImpl extends ProjectRepository {
  ProjectRepositoryImpl(this.projectDataSource);
  final ProjectDataSource projectDataSource;
  @override
  Future<Either<Failure, String>> addProject(
      {required String projectName,
      required String address,
      required String description}) async {
    return handleErrors(() => projectDataSource.addProject(
        projectName: projectName, address: address, description: description));
  }

  @override
  Future<Either<Failure, String>> updateProject(
      {required ProjectModel project}) {
    return handleErrors(
        () => projectDataSource.updateProject(project: project));
  }

  @override
  Future<List<ProjectModel>> allProjects() async {
    List<ProjectModel> allProjectList = [];
    try {
      allProjectList = await projectDataSource.allProjects();
    } catch (e) {
      print(e.toString());
    }
    return allProjectList;
  }
}
