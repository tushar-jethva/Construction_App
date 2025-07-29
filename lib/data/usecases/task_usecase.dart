import 'package:construction_mate/data/repository/task_repository.dart';
import 'package:construction_mate/logic/models/tasks/create_task_model.dart';
import 'package:construction_mate/logic/models/tasks/create_to_do_model.dart';
import 'package:construction_mate/logic/models/tasks/get_task_model.dart';
import 'package:construction_mate/logic/models/tasks/get_to_do_model.dart';
import 'package:construction_mate/logic/models/tasks/update_task_model.dart';
import 'package:construction_mate/utilities/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class TaskUsecase {
  final TaskRepository _repository;

  TaskUsecase(this._repository);

  Future<Either<Failure, String>> addTask({required CreateTaskModel task}) {
    return _repository.addTask(task: task);
  }

  Future<Either<Failure, List<GetTaskModel>>> getTasks(
      {required String projectId}) {
    return _repository.getTasks(projectId: projectId);
  }

  Future<Either<Failure, GetTaskModel>> getTaskById({required String taskId}) {
    return _repository.getTaskById(taskId: taskId);
  }

  Future<Either<Failure, String>> updateTask(
      {required String taskId, UpdateTaskModel? task}) {
    return _repository.updateTask(taskId: taskId, task: task);
  }

  Future<Either<Failure, String>> addTodo(
      {required CreateToDoModel todo, required String taskId}) {
    return _repository.addTodo(todo: todo, taskId: taskId);
  }

  Future<Either<Failure, List<GetTodoModel>>> getTodo(
      {required String taskId}) {
    return _repository.getTodo(taskId: taskId);
  }

  Future<Either<Failure, String>> updateTodo(
      {required String todoId,
      required String status,
      required String taskId}) {
    return _repository.updateTodo(
        todoId: todoId, status: status, taskId: taskId);
  }

  Future<Either<Failure, String>> updateTaskStatus(
      {required String taskId, required String status}) {
    return _repository.updateTaskStatus(taskId: taskId, status: status);
  }

  Future<Either<Failure, String>> deleteTask({required String taskId}) {
    return _repository.deleteTask(taskId: taskId);
  }

  Future<Either<Failure, String>> deleteTodo(
      {required String todoId, required String taskId}) {
    return _repository.deleteTodo(todoId: todoId, taskId: taskId);
  }
}
