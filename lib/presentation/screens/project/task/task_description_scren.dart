import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/Task/add_task/add_task_bloc.dart';
import 'package:construction_mate/logic/controllers/Task/add_todo/add_todo_bloc.dart';
import 'package:construction_mate/logic/controllers/Task/delete_task/delete_task_bloc.dart';
import 'package:construction_mate/logic/controllers/Task/get_tasks/get_tasks_bloc.dart';
import 'package:construction_mate/logic/controllers/Task/task_by_id/task_by_id_bloc.dart';
import 'package:construction_mate/logic/controllers/Task/update_task_progress/update_task_progress_bloc.dart';
import 'package:construction_mate/logic/controllers/Task/update_task_status/update_task_status_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalAgencies/total_agencies_bloc.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/tasks/get_task_model.dart';
import 'package:construction_mate/presentation/screens/project/task/add_task_widget.dart';
import 'package:construction_mate/presentation/screens/project/task/add_todo_widget.dart';
import 'package:construction_mate/presentation/screens/project/task/completed_todo_widget.dart';
import 'package:construction_mate/presentation/screens/project/task/pending_todos_widget.dart';
import 'package:construction_mate/presentation/widgets/common/common_app_bar.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/common_error_and_notfound_widget.dart';
import 'package:construction_mate/presentation/widgets/common/common_icon_circle_widget.dart';
import 'package:construction_mate/presentation/widgets/common/common_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:construction_mate/utilities/extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/constants.dart';

class TaskDescriptionScren extends StatelessWidget {
  final String taskId;
  const TaskDescriptionScren({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Task",
        onTap: () {
          context.pop();
        },
        actions: [],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TaskDescriptionedWidget(
            theme: theme,
            textTheme: textTheme,
            taskId: taskId,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      padding: EdgeInsets.only(top: 20.h),
                      indicator: BoxDecoration(
                        color: purple,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      dividerHeight: 0,
                      dividerColor: transparent,
                      unselectedLabelColor: theme.canvasColor,
                      labelStyle: theme.textTheme.titleLarge
                          ?.copyWith(fontSize: 15.sp, color: white),
                      tabs: const [
                        Tab(child: Text("Pending")),
                        Tab(child: Text("Completed"))
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          PendingTodosScreen(
                            taskId: taskId,
                          ),
                          CompletedTodosScreen(taskId: taskId)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: purple,
        icon: Icons.add,
        activeIcon: Icons.close,
        overlayColor: transparent,
        overlayOpacity: 0.1,
        iconTheme: const IconThemeData(color: white),
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.update,
            ),
            label: 'Update Progress',
            labelStyle: textTheme.titleSmall?.copyWith(color: black),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  builder: (context) {
                    final MediaQueryData mediaQueryData =
                        MediaQuery.of(context);
                    return bottomSheetOfProgress(
                        mediaQueryData, context, theme, textTheme);
                  });
            },
          ),
          SpeedDialChild(
            child: Icon(
              Icons.playlist_add,
            ),
            labelStyle: textTheme.titleSmall?.copyWith(color: black),
            label: 'Add To-do',
            onTap: () {
              context.read<AddTodoBloc>().add(const AddTodoEvent.initialize());
              showModalBottomSheet(
                  context: context,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  builder: (context) {
                    final MediaQueryData mediaQueryData =
                        MediaQuery.of(context);
                    return AddTodoWidget(
                        taskId: taskId,
                        mediaQueryData: mediaQueryData,
                        context: context,
                        theme: theme,
                        textTheme: textTheme);
                  });
            },
          ),
        ],
      ),
    );
  }

  Padding bottomSheetOfProgress(MediaQueryData mediaQueryData,
      BuildContext context, ThemeData theme, TextTheme textTheme) {
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 16.h,
        ),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Progress",
              style: textTheme.titleLarge,
            ),
            10.hx,
            CustomTextFormField(
              hintText: "Progress Qty: (%)",
              labelText: "Progress Qty: (%)",
              textInputType: TextInputType.number,
              textFieldType: TextFieldType.number,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                context.read<UpdateTaskProgressBloc>().add(
                    UpdateTaskProgressEvent.onProgressChanged(
                        progress: num.tryParse(value) ?? 0));
              },
            ),
            20.hx,
            BlocConsumer<UpdateTaskProgressBloc, UpdateTaskProgressState>(
              listener: (context, state) {
                if (state.state.isLoaded) {
                  showTopSnackBar(context, state.message,
                      messageType: MessageType.done);

                  context
                      .read<TaskByIdBloc>()
                      .add(TaskByIdEvent.getTaskById(taskId: taskId));

                  context.pop();
                } else if (state.state.isError) {
                  showTopSnackBar(context, state.message,
                      messageType: MessageType.done);
                  context.pop();
                }
              },
              builder: (context, ustate) {
                return BlocBuilder<TaskByIdBloc, TaskByIdState>(
                  builder: (context, state) {
                    return CustomElevatedButton(
                      isLoading: state.state.isLoading,
                      onTap: () {
                        num total = (state.task?.estQty ?? 0) -
                            (state.task?.progress ?? 0);
                        debugPrint("-------- total $total");
                        if (ustate.progress > total) {
                          return showTopSnackBar(
                              context, "Progress should be less then or $total",
                              messageType: MessageType.error);
                        }
                        context.read<UpdateTaskProgressBloc>().add(
                            UpdateTaskProgressEvent.updateProgress(
                                taskId: taskId));
                      },
                      label: "Add progress",
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class TaskDescriptionedWidget extends StatelessWidget {
  const TaskDescriptionedWidget({
    super.key,
    required this.theme,
    required this.textTheme,
    required this.taskId,
  });

  final ThemeData theme;
  final TextTheme textTheme;
  final String taskId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskByIdBloc, TaskByIdState>(
      builder: (context, state) {
        final task = state.task;
        return state.state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : state.state.isLoaded && state.task != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                        color: theme.cardColor,
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Assign to:",
                                    style: textTheme.labelLarge,
                                  ),
                                  15.hx,
                                  Text("Start/End Date:",
                                      style: textTheme.labelLarge),
                                  15.hx,
                                  Text("Progress:",
                                      style: textTheme.labelLarge),
                                  15.hx,
                                  Text("Status:", style: textTheme.labelLarge),
                                ],
                              ),
                              20.wx,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TaskRowWidget(
                                    desc: (task?.assignee?.isNotEmpty ?? false)
                                        ? task!.assignee!
                                            .map((a) => a.name ?? '')
                                            .join(', ')
                                        : 'No assignee',
                                  ),
                                  10.hx,
                                  TaskRowWidget(
                                    desc:
                                        "${ReusableFunctions.formatDateFromDBToDDMM(isoDate: task?.startDate ?? '')} - ${ReusableFunctions.formatDateFromDBToDDMM(isoDate: task?.endDate ?? '')}",
                                    widget: Icon(
                                      Icons.calendar_month_outlined,
                                      color: theme.canvasColor,
                                      size: 18,
                                    ),
                                  ),
                                  15.hx,
                                  TaskRowWidget(
                                    desc:
                                        "${task?.progress ?? 0} / ${task?.estQty ?? 0} ${task?.unit ?? ''}",
                                    widget: Icon(
                                      Icons.trending_up_rounded,
                                      color: green,
                                      size: 18,
                                    ),
                                  ),
                                  10.hx,
                                  Row(
                                    children: [
                                      TaskRowWidget(
                                        desc: task?.status ?? '',
                                        widget: task?.status == 'pending'
                                            ? const Icon(
                                                Icons.hourglass_top,
                                                color: Colors.amberAccent,
                                                size: 18,
                                              )
                                            : task?.status == 'completed'
                                                ? Icon(
                                                    Icons.check_circle,
                                                    color: green,
                                                    size: 18,
                                                  )
                                                : Icon(
                                                    Icons.close,
                                                    color: red,
                                                    size: 18,
                                                  ),
                                      ),
                                      10.wx,
                                      BlocConsumer<UpdateTaskStatusBloc,
                                          UpdateTaskStatusState>(
                                        listener: (context, state) {
                                          if (state.state.isLoaded) {
                                            showTopSnackBar(
                                                context, state.message,
                                                messageType: MessageType.done);

                                            context.read<TaskByIdBloc>().add(
                                                TaskByIdEvent.getTaskById(
                                                    taskId: taskId));

                                            context.read<GetTasksBloc>().add(
                                                const GetTasksEvent.getTasks());
                                          }
                                          if (state.state.isError) {
                                            showTopSnackBar(
                                                context, state.message,
                                                messageType: MessageType.error);
                                          }
                                        },
                                        builder: (context, state) {
                                          return GestureDetector(
                                            onTap: () {
                                              context
                                                  .read<UpdateTaskStatusBloc>()
                                                  .add(UpdateTaskStatusEvent
                                                      .updateStatus(
                                                    taskId: taskId,
                                                    status: task?.status ==
                                                            'pending'
                                                        ? "completed"
                                                        : "pending",
                                                  ));
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 5),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: borderColor),
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                              child: state.state.isLoading
                                                  ? SpinKitThreeBounce(
                                                      size: 15,
                                                      color: purple,
                                                    )
                                                  : Text(
                                                      task?.status == 'pending'
                                                          ? "Mark Completed"
                                                          : "Mark Pending",
                                                      style: theme
                                                          .textTheme.labelLarge
                                                          ?.copyWith(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: task?.status ==
                                                                'pending'
                                                            ? green
                                                            : Colors.orange,
                                                      ),
                                                    ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  )
                : const Center(child: Text("No task found"));
      },
    );
  }
}

class TaskRowWidget extends StatelessWidget {
  const TaskRowWidget({super.key, this.widget, required this.desc});

  final Widget? widget;
  final String desc;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget ?? const SizedBox.shrink(),
        widget == null ? 0.wx : 5.wx,
        Text(
          desc.capitalize,
          style: textTheme.bodyMedium?.copyWith(fontSize: 14),
        )
      ],
    );
  }
}
