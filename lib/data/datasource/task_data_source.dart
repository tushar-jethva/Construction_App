import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/tasks/create_task_model.dart';
import 'package:construction_mate/logic/models/tasks/create_to_do_model.dart';
import 'package:construction_mate/logic/models/tasks/get_task_model.dart';
import 'package:construction_mate/logic/models/tasks/get_to_do_model.dart';
import 'package:construction_mate/logic/models/tasks/update_task_model.dart';
import 'package:construction_mate/utilities/dio_config/api_service.dart';
import 'package:construction_mate/utilities/dio_config/base_data_center.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

abstract class TaskDataSource {
  //add task
  Future<String> addTask({required CreateTaskModel task});

  //get tasks
  Future<List<GetTaskModel>> getTasks({required String projectId});

  //get task by id
  Future<GetTaskModel> getTaskById({required String taskId});

  //update task
  Future<String> updateTask({required String taskId, UpdateTaskModel? task});

  //add todo
  Future<String> addTodo(
      {required CreateToDoModel todo, required String taskId});

  //get todo
  Future<List<GetTodoModel>> getTodo({required String taskId});

  //update todo
  Future<String> updateTodo(
      {required String todoId, required String status, required String taskId});
}

@LazySingleton(as: TaskDataSource)
class TaskDataSourceImpl implements TaskDataSource {
  final dio = BaseDataCenter().dio.dio;
  @override
  Future<String> addTask({required CreateTaskModel task}) async {
    try {
      final res = await dio.post(API.ADD_TASK, data: task.toJson());

      return res.data['message'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<GetTaskModel>> getTasks({required String projectId}) async {
    final List<GetTaskModel> list = [];
    try {
      final res = await dio.get(
        "${API.GET_TASK_BY_PROJECT}/$projectId",
      );

      debugPrint("--- res ${res.data}");

      for (var task in res.data['data']) {
        try {
          list.add(GetTaskModel.fromJson(task));
        } catch (e) {
          debugPrint("--- error ${e.toString()}");
        }
      }

      debugPrint("--- list ${list.length}");

      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GetTaskModel> getTaskById({required String taskId}) async {
    try {
      final res = await dio.get(
        "${API.GET_TASK_BY_ID}/$taskId",
      );

      return GetTaskModel.fromJson(res.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> updateTask(
      {required String taskId, UpdateTaskModel? task}) async {
    try {
      debugPrint("------ res ${task?.progress}");
      final res = await dio.put(
        "${API.UPDATE_TASK}/$taskId",
        data: {'progress': task?.progress ?? 0},
      );

      debugPrint("--- res update ${res.data}");

      return res.data['message'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> addTodo(
      {required CreateToDoModel todo, required String taskId}) async {
    try {
      final res = await dio.post(
        "${API.ADD_TODO}/$taskId",
        data: todo.toJson(),
      );

      return res.data['message'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<GetTodoModel>> getTodo({required String taskId}) async {
    final List<GetTodoModel> list = [];
    try {
      final res = await dio.get(
        "${API.GET_TODO}/$taskId",
      );

      for (var todo in res.data['data']) {
        list.add(GetTodoModel.fromJson(todo));
      }

      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> updateTodo(
      {required String todoId,
      required String status,
      required String taskId}) async {
    try {
      final res = await dio.put(
        "${API.UPDATE_TODO}/$taskId/$todoId",
        data: {'status': status},
      );

      return res.data['message'];
    } catch (e) {
      rethrow;
    }
  }
}
