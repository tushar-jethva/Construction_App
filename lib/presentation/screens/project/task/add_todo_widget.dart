import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/Task/add_todo/add_todo_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalAgencies/total_agencies_bloc.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/common_error_and_notfound_widget.dart';
import 'package:construction_mate/presentation/widgets/common/common_icon_circle_widget.dart';
import 'package:construction_mate/presentation/widgets/common/common_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class AddTodoWidget extends StatelessWidget {
  const AddTodoWidget({
    super.key,
    required this.taskId,
    required this.mediaQueryData,
    required this.context,
    required this.theme,
    required this.textTheme,
  });

  final String taskId;
  final MediaQueryData mediaQueryData;
  final BuildContext context;
  final ThemeData theme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTodoBloc, AddTodoState>(
      builder: (context, state) {
        return Padding(
          padding: mediaQueryData.viewInsets,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25 +
                (state.assignees.length * 90.h),
            width: double.infinity,
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
              top: 16.h,
            ),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r)),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "To-Do",
                    style: textTheme.titleLarge,
                  ),
                  10.hx,
                  CustomTextFormField(
                    hintText: "Name",
                    labelText: "Name",
                    textInputType: TextInputType.text,
                    textFieldType: TextFieldType.text,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      context
                          .read<AddTodoBloc>()
                          .add(AddTodoEvent.nameChanged(name: value));
                    },
                  ),
                  BlocBuilder<AddTodoBloc, AddTodoState>(
                    builder: (context, state) {
                      return state.assignees.isNotEmpty
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Assignees",
                                  style: theme.textTheme.titleMedium!.copyWith(
                                    fontSize: 16.sp,
                                  ),
                                ),
                                10.hx,
                                ...List.generate(
                                  state.assignees.length,
                                  (index) {
                                    final agency = state.assignees[index];
                                    return SelectedAgencyWidget(
                                        agency: agency, index: index);
                                  },
                                ),
                              ],
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          showDragHandle: true,
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          builder: (context) {
                            return const SelectAssigneeWidget();
                          });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_add_alt,
                          color: purple,
                        ),
                        10.wx,
                        Text("Assignee",
                            style: theme.textTheme.titleMedium!
                                .copyWith(fontSize: 16.sp, color: purple)),
                      ],
                    ),
                  ),
                  10.hx,
                  BlocConsumer<AddTodoBloc, AddTodoState>(
                    listener: (context, state) {
                      if (state.state.isLoaded) {
                        showTopSnackBar(context, state.message,
                            messageType: MessageType.done);

                        context.pop();
                      } else if (state.state.isError) {
                        showTopSnackBar(context, state.message,
                            messageType: MessageType.done);
                        context.pop();
                      }
                    },
                    builder: (context, state) {
                      return CustomElevatedButton(
                        isLoading: state.state.isLoading,
                        onTap: () {
                          context
                              .read<AddTodoBloc>()
                              .add(AddTodoEvent.createTodo(taskId: taskId));
                        },
                        label: "Add ToDo",
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SelectAssigneeWidget extends StatefulWidget {
  const SelectAssigneeWidget({
    super.key,
  });

  @override
  State<SelectAssigneeWidget> createState() => _SelectAssigneeWidgetState();
}

class _SelectAssigneeWidgetState extends State<SelectAssigneeWidget> {
  late TotalAgenciesBloc _totalAgenciesBloc;

  @override
  void initState() {
    super.initState();
    _totalAgenciesBloc = BlocProvider.of<TotalAgenciesBloc>(context);
    _totalAgenciesBloc.add(LoadTotalAgencies());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<TotalAgenciesBloc, TotalAgenciesState>(
      builder: (context, state) {
        if (state is TotalAgenciesInitial) {
          return Shimmer(
            gradient: LinearGradient(
                colors: [theme.hoverColor, theme.cardColor],
                stops: const [0.1, 0.8]),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: 15.0.w, right: 15.w, bottom: 10.h),
                    child: Container(
                      height: ReusableFunctions.getHeight(
                          context: context, height: 0.08),
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerBox(height: 10, width: 150),
                          ShimmerBox(height: 10, width: 50)
                        ],
                      ),
                    ),
                  );
                }),
          );
        }
        if (state is TotalAgenciesLoadSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.totalAgencies.length,
            itemBuilder: (context, index) {
              final agency = state.totalAgencies[index];
              return GestureDetector(
                onTap: () {},
                child: SelectOneAgencyWidget(index: index, agency: agency),
              );
            },
          );
        }
        return const ErrorAndNotFoundWidget(
          text: "Something went wrong!",
        );
      },
    );
  }
}

class SelectOneAgencyWidget extends StatelessWidget {
  const SelectOneAgencyWidget(
      {super.key, required this.agency, required this.index});

  final AgencyModel agency;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        // Handle agency selection
        context.read<AddTodoBloc>().add(AddTodoEvent.assigneesChanged(
            assignee: agency)); // Update assignees
        Navigator.pop(context); // Close the bottom sheet
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 20.h),
        child: ListTile(
          leading: IconCircleWidget(
            radius: 10,
            isSvg: true,
            svgpath: userIcons[index % userIcons.length],
            backgroundColor: theme.cardColor,
          ),
          title: Text(agency.name ?? "No Name",
              style: theme.textTheme.titleMedium!.copyWith(fontSize: 16.sp)),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}

class SelectedAgencyWidget extends StatelessWidget {
  const SelectedAgencyWidget(
      {super.key, required this.agency, required this.index});

  final AgencyModel agency;
  final int index;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.only(bottom: 20.h),
      leading: IconCircleWidget(
        radius: 10,
        isSvg: true,
        svgpath: userIcons[index % userIcons.length],
        backgroundColor: theme.cardColor,
      ),
      title: Text(agency.name ?? "No Name",
          style: theme.textTheme.titleMedium!.copyWith(fontSize: 16.sp)),
      trailing: GestureDetector(
          onTap: () {
            // Handle agency removal
            context.read<AddTodoBloc>().add(AddTodoEvent.removeAssignee(
                assigneeId: agency.sId ?? '')); // Update assignees
          },
          child: const Icon(Icons.cancel_rounded)),
    );
  }
}
