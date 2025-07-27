import 'package:construction_mate/data/datasource/task_data_source.dart';
import 'package:construction_mate/logic/models/tasks/create_task_model.dart';
import 'package:construction_mate/logic/models/tasks/create_to_do_model.dart';
import 'package:construction_mate/logic/models/tasks/get_task_model.dart';
import 'package:construction_mate/logic/models/tasks/get_to_do_model.dart';
import 'package:construction_mate/logic/models/tasks/update_task_model.dart';
import 'package:construction_mate/utilities/error_handling/error_handler.dart';
import 'package:construction_mate/utilities/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class TaskRepository {
  Future<Either<Failure, String>> addTask({required CreateTaskModel task});

  //get tasks
  Future<Either<Failure, List<GetTaskModel>>> getTasks(
      {required String projectId});

  //get task by id
  Future<Either<Failure, GetTaskModel>> getTaskById({required String taskId});

  //update task
  Future<Either<Failure, String>> updateTask(
      {required String taskId, UpdateTaskModel? task});

  //add todo
  Future<Either<Failure, String>> addTodo(
      {required CreateToDoModel todo, required String taskId});

  //get todo
  Future<Either<Failure, List<GetTodoModel>>> getTodo({required String taskId});

  //update todo
  Future<Either<Failure, String>> updateTodo(
      {required String todoId, required String status, required String taskId});
}

@LazySingleton(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskDataSource dataSource;
  TaskRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, String>> addTask({required CreateTaskModel task}) {
    return handleErrors(() => dataSource.addTask(task: task));
  }

  @override
  Future<Either<Failure, List<GetTaskModel>>> getTasks(
      {required String projectId}) {
    return handleErrors(() => dataSource.getTasks(projectId: projectId));
  }

  @override
  Future<Either<Failure, GetTaskModel>> getTaskById({required String taskId}) {
    return handleErrors(() => dataSource.getTaskById(taskId: taskId));
  }

  @override
  Future<Either<Failure, String>> updateTask(
      {required String taskId, UpdateTaskModel? task}) {
    return handleErrors(
        () => dataSource.updateTask(taskId: taskId, task: task));
  }

  @override
  Future<Either<Failure, String>> addTodo(
      {required CreateToDoModel todo, required String taskId}) {
    return handleErrors(() => dataSource.addTodo(todo: todo, taskId: taskId));
  }

  @override
  Future<Either<Failure, List<GetTodoModel>>> getTodo(
      {required String taskId}) {
    return handleErrors(() => dataSource.getTodo(taskId: taskId));
  }

  @override
  Future<Either<Failure, String>> updateTodo(
      {required String todoId,
      required String status,
      required String taskId}) {
    return handleErrors(() =>
        dataSource.updateTodo(todoId: todoId, status: status, taskId: taskId));
  }
}
