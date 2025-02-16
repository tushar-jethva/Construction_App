import 'dart:convert';
import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/utilities/dio_config/base_data_center.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class ProjectDataSource {
  Future<String> addProject(
      {required String projectName,
      required String address,
      required String description});

  Future<String> updateProject({required ProjectModel project});

  Future<List<ProjectModel>> allProjects();
}

class ProjectDataSourceImpl extends ProjectDataSource {
  final dio = BaseDataCenter().dio.dio;

  @override
  Future<String> addProject(
      {required String projectName,
      required String address,
      required String description}) async {
    try {
      ProjectModel projectModel = ProjectModel(
          name: projectName, address: address, description: description);
      await dio.post(
        API.ADD_PROJECT_URL,
        data: projectModel.toJson(),
      );

      return "Project added successfully";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ProjectModel>> allProjects() async {
    List<ProjectModel> allProjectList = [];
    try {
      final res = await dio.get(
        API.GET_PROJECT_URL,
      );
      final projects = res.data;

      debugPrint('--------- projects ---- $projects');
      for (var project in projects["data"]) {
        allProjectList.add(ProjectModel.fromJson(project));
      }
    } catch (e) {
      print("All Projects: ${e.toString()}");
    }
    return allProjectList;
  }

  @override
  Future<String> updateProject({required ProjectModel project}) async {
    try {
      await dio.put("${API.UPDATE_PROJECT_URL}/${project.sId}",
          data: project.toJson());
      return "Project added successfully";
    } catch (e) {
      rethrow;
    }
  }
}
