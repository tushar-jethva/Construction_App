import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/data/datasource/project_data_source.dart';
import 'package:construction_mate/data/repository/project_repository.dart';
import 'package:construction_mate/logic/controllers/ProjectListBloc/project_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/custom_button_with_widget.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/custom_textfield.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyProjectAddBottomSheet extends StatefulWidget {
  const MyProjectAddBottomSheet({super.key});

  @override
  State<MyProjectAddBottomSheet> createState() =>
      _MyProjectAddBottomSheetState();
}

class _MyProjectAddBottomSheetState extends State<MyProjectAddBottomSheet> {
  final TextEditingController _projectNameController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ProjectRepository projectRepository =
      ProjectRepositoryImpl(ProjectDataSourceImpl());

  @override
  dispose() {
    super.dispose();
    _projectNameController.dispose();
    _descriptionController.dispose();
  }

  void addProject() async {
    context.read<ProjectBloc>().add(AddProject(
        projectAddress: _addressController.text,
        projectName: _projectNameController.text,
        projectDescription: _descriptionController.text));
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Padding(
      padding: mediaQueryData.viewInsets,
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
              Container(
                height: 7.w,
                width: 50.w,
                margin: EdgeInsets.symmetric(vertical: 15.h),
                decoration: BoxDecoration(
                    color: grey, borderRadius: BorderRadius.circular(8)),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyCustomTextFormField(
                      controller: _projectNameController,
                      hintText: 'Project Name',
                      maxLines: 1,
                      textInputType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter project name!';
                        }
                      },
                    ),
                    Gap(15.h),
                    MyCustomTextFormField(
                      controller: _addressController,
                      hintText: 'Project Address',
                      maxLines: 1,
                      textInputType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter project address!';
                        }
                      },
                    ),
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
              BlocListener<ProjectBloc, ProjectState>(
                listener: (context, state) {
                  if (state is ProjectAddSuccess) {
                    Navigator.pop(context);
                  }
                },
                child: BlocBuilder<ProjectBloc, ProjectState>(
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: MyCustomButtonWidget(
                        widget: state is ProjectAddLoading
                            ? const CircularProgressIndicator(
                                color: white,
                              )
                            : const Text(
                                'Add Project',
                                style: TextStyle(
                                    color: white, fontWeight: FontWeight.w500),
                              ),
                        color: green,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            addProject();
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
