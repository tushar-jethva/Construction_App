import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/logic/controllers/ProjectListBloc/project_bloc.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/widgets/common/custom_textfield.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class MyProjectAddBottomSheet extends StatefulWidget {
  const MyProjectAddBottomSheet({super.key});

  @override
  State<MyProjectAddBottomSheet> createState() =>
      _MyProjectAddBottomSheetState();
}

class _MyProjectAddBottomSheetState extends State<MyProjectAddBottomSheet> {
  final TextEditingController _projectNameController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  @override
  dispose() {
    super.dispose();
    _projectNameController.dispose();
    _descriptionController.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateBlocBloc dateBloc = BlocProvider.of<DateBlocBloc>(context);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      dateBloc.add(DateChanged(dateTime: picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: Container(
          height: 380.h,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r))),
          child: Column(
            children: [
              Container(
                height: 7.w,
                width: 50.w,
                margin: EdgeInsets.symmetric(vertical: 15.h),
                decoration: BoxDecoration(
                    color: grey, borderRadius: BorderRadius.circular(8)),
              ),
              MyCustomTextField(
                controller: _projectNameController,
                hintText: 'Project Name',
                maxLines: 1,
              ),
              Gap(15.h),
              Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: grey,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<DateBlocBloc, DateBlocState>(
                      builder: (context, state) {
                        final String formattedDate =
                            DateFormat.yMMMd().format(state.selectedDate);
                        return Text(
                          formattedDate,
                        );
                      },
                    ),
                    InkWell(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: const Icon(Icons.calendar_month))
                  ],
                ),
              ),
              Gap(15.h),
              MyCustomTextField(
                controller: _descriptionController,
                hintText: 'Project Description',
                maxLines: 3,
              ),
              Gap(20.h),
              Row(
                children: [
                  Expanded(
                    child: MyCustomButton(
                      buttonName: 'Add Project',
                      color: green,
                      style: const TextStyle(
                          color: white, fontWeight: FontWeight.w500),
                      onPressed: () {
                        final startDateState =
                            context.read<DateBlocBloc>().state;
                        if (_projectNameController.text.isNotEmpty) {
                          projects.add(ProjectModel(
                              projectName: _projectNameController.text,
                              startDate: startDateState.selectedDate.toString(),
                              description: _descriptionController.text,
                              payIn: 0,
                              payOut: 0));
                        }
                        context.read<ProjectBloc>().add(LoadProjects());
                        context.pushNamed(RoutesName.detailsScreen);
                        Navigator.pop(context);
                        context
                            .read<DateBlocBloc>()
                            .add(DateChanged(dateTime: DateTime.now()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
