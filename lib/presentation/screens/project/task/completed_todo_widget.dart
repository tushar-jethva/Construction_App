import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/Task/add_task/add_task_bloc.dart';
import 'package:construction_mate/logic/controllers/Task/get_tasks/get_tasks_bloc.dart';
import 'package:construction_mate/logic/controllers/Task/get_todos/get_todos_bloc.dart';
import 'package:construction_mate/logic/controllers/Task/update_todo/update_todo_bloc.dart';
import 'package:construction_mate/logic/models/tasks/get_task_model.dart';
import 'package:construction_mate/logic/models/tasks/get_to_do_model.dart';
import 'package:construction_mate/presentation/router/go_router.dart';
import 'package:construction_mate/presentation/widgets/common/common_error_and_notfound_widget.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:construction_mate/utilities/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CompletedTodosScreen extends StatefulWidget {
  final String taskId;
  const CompletedTodosScreen({super.key, required this.taskId});

  @override
  State<CompletedTodosScreen> createState() => _CompletedTodosScreenState();
}

class _CompletedTodosScreenState extends State<CompletedTodosScreen> {
  Future<void> onRefresh() async {
    context.read<GetTasksBloc>().add(const GetTasksEvent.getTasks());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: purple,
      onRefresh: onRefresh,
      child: BlocBuilder<GetTodosBloc, GetTodosState>(
        builder: (context, state) {
          return state.state.isLoading
              ? Skeletonizer(
                  child: TodoOneWidget(
                  taskId: widget.taskId,
                ))
              : state.state.isLoaded && state.todosCompleted.isNotEmpty
                  ? ListView.separated(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // context.pushNamed(
                            //     RoutesName.TASK_DESCRIPTION_SCREEN_NAME,
                            //     pathParameters: {
                            //       TASK_ID: state.tasks[index].sId ?? ''
                            //     });
                          },
                          child: TodoOneWidget(
                            task: state.todosCompleted[index],
                            taskId: widget.taskId,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(),
                        );
                      },
                      itemCount: state.todosCompleted.length)
                  : const ErrorAndNotFoundWidget(text: "Todos Not found");
        },
      ),
    );
  }
}

class TodoOneWidget extends StatelessWidget {
  const TodoOneWidget({super.key, this.task, required this.taskId});

  final GetTodoModel? task;
  final String taskId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding:
          EdgeInsets.only(left: 16.w, right: 16.w, top: 10.h, bottom: 10.h),
      child: Container(
        color: transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task?.workName ?? '',
                  style: theme.textTheme.titleMedium?.copyWith(fontSize: 14),
                ),
                5.hx,
                Text(
                  "Assignees: ${task?.assignee?.length ?? 0}",
                  style: theme.textTheme.labelLarge?.copyWith(fontSize: 12),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  (task?.status?.capitalize ?? ''),
                  style: theme.textTheme.bodyMedium?.copyWith(
                      color: task?.status == 'pending'
                          ? Colors.amber
                          : task?.status == 'completed'
                              ? Colors.green
                              : Colors.red),
                ),
                3.hx,
                task?.status == 'pending'
                    ? BlocConsumer<UpdateTodoBloc, UpdateTodoState>(
                        listener: (context, state) {
                          if (state.state.isLoaded) {
                            context
                                .read<GetTodosBloc>()
                                .add(GetTodosEvent.getTodos(taskId: taskId));
                            showTopSnackBar(context, state.message,
                                messageType: MessageType.done);
                          }
                          if (state.state.isError) {
                            showTopSnackBar(context, state.message,
                                messageType: MessageType.error);
                          }
                        },
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () {
                              context.read<UpdateTodoBloc>().add(
                                  UpdateTodoEvent.todoIdChanged(
                                      todoId: task?.sId ?? ''));
                              context.read<UpdateTodoBloc>().add(
                                  UpdateTodoEvent.updateTodo(
                                      taskId: taskId,
                                      todoId: task?.sId ?? '',
                                      status: "completed"));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: borderColor),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: state.state.isLoading &&
                                      state.todoId == task?.sId
                                  ? SpinKitThreeBounce(
                                      size: 15,
                                      color: purple,
                                    )
                                  : Text(
                                      "Mark Completed",
                                      style: theme.textTheme.labelLarge
                                          ?.copyWith(
                                              fontSize: 12, color: green),
                                    ),
                            ),
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
