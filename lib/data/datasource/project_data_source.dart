import 'dart:convert';
import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:http/http.dart' as http;

abstract class ProjectDataSource {
  Future<void> addProject(
      {required String projectName,
      required String address,
      required String description});

  Future<List<ProjectModel>> allProjects();
}

class ProjectDataSourceImpl extends ProjectDataSource {
  @override
  Future<void> addProject(
      {required String projectName,
      required String address,
      required String description}) async {
    try {
      ProjectModel projectModel = ProjectModel(
          name: projectName, address: address, description: description);
      await http.post(
        Uri.parse(API.ADD_PROJECT_URL),
        body: projectModel.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
    } catch (e) {}
  }

  @override
  Future<List<ProjectModel>> allProjects() async {
    List<ProjectModel> allProjectList = [];
    try {
      print("Hello");
      http.Response res = await http.get(
        Uri.parse(API.GET_PROJECT_URL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final projects = jsonDecode(res.body);
      for (var project in projects["data"]) {
        allProjectList.add(ProjectModel.fromJson(project));
      }
    } catch (e) {
      print("All Projects: ${e.toString()}");
    }
    return allProjectList;
  }
}
