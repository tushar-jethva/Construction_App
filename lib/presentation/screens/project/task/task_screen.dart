import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/Task/current_task/current_task_bloc.dart';
import 'package:construction_mate/logic/controllers/Task/delete_task/delete_task_bloc.dart';
import 'package:construction_mate/logic/controllers/Task/get_tasks/get_tasks_bloc.dart';
import 'package:construction_mate/logic/models/tasks/get_task_model.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TaskScreen extends StatefulWidget {
  final ScrollController scrollController;
  const TaskScreen({super.key, required this.scrollController});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  void initState() {
    super.initState();
    context.read<GetTasksBloc>().add(const GetTasksEvent.getTasks());
  }

  Future<void> onRefresh() async {
    context.read<GetTasksBloc>().add(const GetTasksEvent.getTasks());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: purple,
      onRefresh: onRefresh,
      child: BlocBuilder<GetTasksBloc, GetTasksState>(
        builder: (context, state) {
          return state.state.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: purple,
                ))
              : state.state.isLoaded && state.tasks.isNotEmpty
                  ? ListView.separated(
                      controller: widget.scrollController,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.read<CurrentTaskBloc>().add(
                                CurrentTaskEvent.setCurrentTask(
                                    task: state.tasks[index]));
                            context.pushNamed(
                                RoutesName.TASK_DESCRIPTION_SCREEN_NAME,
                                pathParameters: {
                                  TASK_ID: state.tasks[index].sId ?? ''
                                });
                          },
                          child: TaskOneWidget(
                            task: state.tasks[index],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Divider(),
                        );
                      },
                      itemCount: state.tasks.length)
                  : const Text("No tasks found");
        },
      ),
    );
  }
}

class TaskOneWidget extends StatelessWidget {
  const TaskOneWidget({
    super.key,
    this.task,
  });

  final GetTaskModel? task;

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
                  task?.name ?? '',
                  style: theme.textTheme.titleMedium?.copyWith(fontSize: 14),
                ),
                5.hx,
                Text(
                  "${ReusableFunctions.formatDateFromDBToDDMM(isoDate: task?.startDate ?? '')} - ${ReusableFunctions.formatDateFromDBToDDMM(isoDate: task?.endDate ?? '')}",
                  style: theme.textTheme.labelLarge?.copyWith(fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Text(
                    //   "Last Updated: ${task.}",
                    //   style: theme.textTheme.labelLarge?.copyWith(fontSize: 12),
                    // ),
                    // 3.hx,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: "${task?.progress ?? 0}",
                              style: theme.textTheme.titleMedium
                                  ?.copyWith(fontSize: 14)),
                          TextSpan(
                              text:
                                  " / ${task?.estQty ?? 0} ${task?.unit ?? ''}",
                              style: theme.textTheme.bodyMedium
                                  ?.copyWith(fontSize: 12))
                        ],
                      ),
                    ),
                    3.hx,
                    Text(
                      task?.status ?? '',
                      style: theme.textTheme.bodyMedium?.copyWith(
                          color: task?.status == 'pending'
                              ? Colors.amber
                              : task?.status == 'completed'
                                  ? Colors.green
                                  : Colors.red),
                    ),
                  ],
                ),
                10.hx,
                BlocConsumer<DeleteTaskBloc, DeleteTaskState>(
                  listener: (context, state) {
                    if (state.state.isLoaded) {
                      showTopSnackBar(context, state.message,
                          messageType: MessageType.done);
                      context
                          .read<GetTasksBloc>()
                          .add(const GetTasksEvent.getTasks());
                    }
                  },
                  builder: (context, state) {
                    return PopupMenuButton<String>(
                      menuPadding: EdgeInsets.zero,
                      color: theme.cardColor,
                      icon: Icon(
                        Icons.more_vert,
                        color: theme.canvasColor,
                      ), // ︙ icon
                      onSelected: (value) {
                        if (value == 'delete') {
                          context.read<DeleteTaskBloc>().add(
                              DeleteTaskEvent.deleteTask(
                                  taskId: task?.sId ?? ''));
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              const Icon(Icons.delete, color: Colors.red),
                              Text(
                                "Delete",
                                style: theme.textTheme.titleMedium!
                                    .copyWith(fontSize: 14.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
