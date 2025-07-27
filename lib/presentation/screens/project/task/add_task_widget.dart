import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/Task/add_task/add_task_bloc.dart';
import 'package:construction_mate/logic/controllers/Task/get_tasks/get_tasks_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalAgencies/total_agencies_bloc.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/common_error_and_notfound_widget.dart';
import 'package:construction_mate/presentation/widgets/common/common_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/drop_down.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:construction_mate/utilities/extension/toast_extenstion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../widgets/common/common_icon_circle_widget.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  State<AddTaskWidget> createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Padding(
      padding: mediaQueryData.viewInsets,
      child: FractionallySizedBox(
        heightFactor: 0.55,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
            ),
            child: Column(
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        labelText: 'Task Name',
                        hintText: 'Enter task name',
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.name,
                        onChanged: (value) {
                          // Handle task name change
                          context.read<AddTaskBloc>().add(
                              AddTaskEvent.taskNameChanged(taskName: value));
                        },
                      ),
                      10.hx,
                      CustomTextFormField(
                        labelText: 'Duration(Days)*',
                        hintText: 'Enter Duration(Days)',
                        textInputAction: TextInputAction.next,
                        onChanged: (value) {
                          // Handle duration change
                          context.read<AddTaskBloc>().add(
                              AddTaskEvent.durationChanged(duration: value));
                        },
                      ),
                      10.hx,
                      BlocBuilder<AddTaskBloc, AddTaskState>(
                        builder: (context, state) {
                          return Row(
                            children: [
                              Expanded(
                                child: CustomTextFormField(
                                  controller: TextEditingController(
                                    text: state.startDate != null
                                        ? ReusableFunctions.getFormattedDate2(
                                            state.startDate!)
                                        : '',
                                  ),
                                  labelText: 'Start Date',
                                  hintText: ' Start Date',
                                  textInputAction: TextInputAction.next,
                                  isReadOnly: true,
                                  prefixIcon: const Icon(Icons.calendar_today),
                                  onTap: () {
                                    ReusableFunctions.showDatePicker(
                                        context: context,
                                        onDateSelected: (val) {
                                          // Handle start date selection
                                          context.read<AddTaskBloc>().add(
                                              AddTaskEvent.startDateChanged(
                                                  startDate: val));
                                        });
                                  },
                                ),
                              ),
                              // 20.wx,
                              // Expanded(
                              //   child: CustomTextFormField(
                              //     controller: TextEditingController(
                              //       text: state.endDate != null
                              //           ? ReusableFunctions.getFormattedDate2(
                              //               state.endDate!)
                              //           : '',
                              //     ),
                              //     labelText: 'End Date',
                              //     hintText: ' End Date',
                              //     textInputAction: TextInputAction.next,
                              //     isReadOnly: true,
                              //     prefixIcon: const Icon(Icons.calendar_today),
                              //     onTap: () {
                              //       ReusableFunctions.showDatePicker(
                              //           context: context,
                              //           onDateSelected: (val) {
                              //             // Handle end date selection
                              //             context.read<AddTaskBloc>().add(
                              //                 AddTaskEvent.endDateChanged(
                              //                     endDate: val));
                              //           });
                              //     },
                              //   ),
                              // ),
                            ],
                          );
                        },
                      ),
                      10.hx,
                      Row(
                        children: [
                          Expanded(
                              child: CustomDropdown(
                            overlayHeight:
                                MediaQuery.of(context).size.height * 0.5,
                            items: units,
                            onChanged: (val) {
                              // Handle progress unit change
                              context.read<AddTaskBloc>().add(
                                  AddTaskEvent.progressUnitChanged(
                                      progressUnit: val ?? ''));
                            },
                            hintText: "Progress Unit*",
                            decoration: CustomDropdownDecoration(
                              listItemStyle: theme.textTheme.titleMedium
                                  ?.copyWith(
                                      color: theme.scaffoldBackgroundColor),
                              closedFillColor: transparent,
                              expandedFillColor: theme.canvasColor,
                              closedBorder: Border.all(color: grey),
                              closedBorderRadius: BorderRadius.circular(12),
                              hintStyle: theme.textTheme.titleMedium!
                                  .copyWith(color: grey, fontSize: 14.sp),
                            ),
                          )),
                          20.wx,
                          Expanded(
                            child: BlocBuilder<AddTaskBloc, AddTaskState>(
                              builder: (context, state) {
                                return CustomTextFormField(
                                  controller: state.progressUnit == "%"
                                      ? TextEditingController(text: '100')
                                      : null,
                                  labelText: 'Est. Quantity *',
                                  hintText: 'Est. Quantity *',
                                  textInputAction: TextInputAction.next,
                                  textInputType: TextInputType.number,
                                  textFieldType: TextFieldType.number,
                                  isReadOnly:
                                      state.progressUnit == "%" ? true : false,
                                  onChanged: (value) {
                                    // Handle estimated quantity change
                                    context.read<AddTaskBloc>().add(
                                        AddTaskEvent.estQuantityChanged(
                                            estQuantity: value));
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      10.hx,
                      BlocBuilder<AddTaskBloc, AddTaskState>(
                        builder: (context, state) {
                          return state.assignees.isNotEmpty
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Assignees",
                                      style:
                                          theme.textTheme.titleMedium!.copyWith(
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
                                return SelectAssigneeWidget();
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
                      30.hx,
                      BlocConsumer<AddTaskBloc, AddTaskState>(
                        listener: (context, state) {
                          if (state.state.isLoaded) {
                            showTopSnackBar(context, state.message,
                                messageType: MessageType.done);
                            context
                                .read<GetTasksBloc>()
                                .add(const GetTasksEvent.getTasks());
                            Navigator.pop(context);
                          } else if (state.state.isError) {
                            showTopSnackBar(context, state.message,
                                messageType: MessageType.error);
                            Navigator.pop(context);
                          }
                        },
                        builder: (context, state) {
                          return CustomElevatedButton(
                            isLoading: state.state.isLoading,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                context
                                    .read<AddTaskBloc>()
                                    .add(const AddTaskEvent.addTask());
                              }
                            },
                            label: 'Save',
                          );
                        },
                      ),
                      20.hx,
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
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
        context.read<AddTaskBloc>().add(AddTaskEvent.assigneesChanged(
            assignees: [agency])); // Update assignees
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
            context.read<AddTaskBloc>().add(AddTaskEvent.removeAssignee(
                assigneeId: agency.sId ?? '')); // Update assignees
          },
          child: const Icon(Icons.cancel_rounded)),
    );
  }
}
