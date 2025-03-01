// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/FloorNameAndFeet/floor_name_and_feet_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:construction_mate/data/datasource/building_data_source.dart';
import 'package:construction_mate/data/repository/building_repository.dart';
import 'package:construction_mate/logic/controllers/BuildingAddBloc/buildings_bloc.dart';
import 'package:construction_mate/logic/controllers/StartAndEndDateBloc/start_and_end_date_bloc.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:go_router/go_router.dart';

class MyBuildingAddBottomSheetWidget extends StatefulWidget {
  final ProjectModel project;
  const MyBuildingAddBottomSheetWidget({
    super.key,
    required this.project,
  });

  @override
  State<MyBuildingAddBottomSheetWidget> createState() =>
      _MyBuildingAddBottomSheetWidgetState();
}

class _MyBuildingAddBottomSheetWidgetState
    extends State<MyBuildingAddBottomSheetWidget> {
  final TextEditingController _buildingNameController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _unitPerFootController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  List<Map<String, String>> moneyAndFloor = [];
  final _formKey = GlobalKey<FormState>();

  final BuildingRepository buildingRepository =
      BuildingRepositoryImpl(BuildingDataSourceImpl());

  @override
  dispose() {
    super.dispose();
    _buildingNameController.dispose();
    _floorController.dispose();
    _unitPerFootController.dispose();
    _descriptionController.dispose();
  }

  Future<void> _selectDateStart(BuildContext context) async {
    final StartAndEndDateBloc dateBloc =
        BlocProvider.of<StartAndEndDateBloc>(context);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      dateBloc.add(StartAndEndDateEvent.onStartDateChanged(startDate: picked));
    }
  }

  Future<void> _selectDateEnd(BuildContext context) async {
    final StartAndEndDateBloc dateBloc =
        BlocProvider.of<StartAndEndDateBloc>(context);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != DateTime.now()) {
      dateBloc.add(StartAndEndDateEvent.onEndDateChanged(endDate: picked));
    }
  }

  Future<void> addBuilding() async {
    final state = context.read<FloorNameAndFeetBloc>().state;
    context.read<BuildingsBloc>().add(AddBuilding(
        buildName: _buildingNameController.text,
        floors: _floorController.text,
        floorArray: state.listOfFloorNameAndFeetState,
        description: _descriptionController.text,
        projectId: widget.project.sId!));
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
                  topRight: Radius.circular(15.r))),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyCustomTextFormField(
                      controller: _buildingNameController,
                      hintText: 'Building Name',
                      maxLines: 1,
                      textInputType: TextInputType.name,
                      // ignore: body_might_complete_normally_nullable
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !ReusableFunctions.isValidInput(value ?? '')) {
                          return 'Please enter building name!';
                        }
                      },
                    ),
                    Gap(15.h),
                    MyCustomTextFormField(
                      controller: _floorController,
                      textInputType: TextInputType.number,
                      hintText: "Floors",
                      // ignore: body_might_complete_normally_nullable
                      onChanged: (value) {
                        context.read<FloorNameAndFeetBloc>().add(FloorChanged(
                            floors: value!.isNotEmpty ? value : "0"));
                      },
                      maxLines: 1,
                      // ignore: body_might_complete_normally_nullable
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please add floors!';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter valid digit!';
                        }
                        if (value.startsWith('-')) {
                          return 'Please enter valid digit!';
                        }
                        if (int.tryParse(value)! <= 0) {
                          return 'Please enter valid floors';
                        }
                        if (int.tryParse(value)! > 100) {
                          return 'Floors should be less than 100';
                        }
                      },
                    ),
                    Gap(20.h),
                    Row(
                      children: [
                        Expanded(
                          child: MyCustomTextFormField(
                            controller: _unitPerFootController,
                            textInputType: TextInputType.number,
                            hintText: 'Sq. feet per floor',
                            maxLines: 1,
                            // ignore: body_might_complete_normally_nullable
                            onChanged: (value) {
                              context
                                  .read<FloorNameAndFeetBloc>()
                                  .add(FootsChagned(foots: value!));
                            },
                            // ignore: body_might_complete_normally_nullable
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please add foot per floor!';
                              }
                              if (int.tryParse(value) == null) {
                                return 'Please enter valid digit!';
                              }
                              if (value.startsWith('-')) {
                                return 'Please enter valid digit!';
                              }
                            },
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              if (_floorController.text.isEmpty) {
                                showTopSnackBar(context, "Please enter floors");
                              } else if (_unitPerFootController.text.isEmpty) {
                                showTopSnackBar(
                                    context, "Please enter unit per floor");
                              } else {
                                context.push(RoutesName.footAndFloorScreen,
                                    extra:
                                        context.read<FloorNameAndFeetBloc>());
                              }
                            },
                            icon: Icon(
                              Icons.edit,
                              color: theme.canvasColor,
                            ))
                      ],
                    ),
                    Gap(15.h),
                    MyCustomTextFormField(
                      controller: _descriptionController,
                      hintText: 'Description',
                      maxLines: 3,
                      textInputType: TextInputType.name,
                      // ignore: body_might_complete_normally_nullable
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !ReusableFunctions.isValidInput(value ?? '')) {
                          return 'Please add description!';
                        }
                      },
                    ),
                  ],
                ),
              ),
              Gap(20.h),
              BlocListener<BuildingsBloc, BuildingsState>(
                listener: (context, state) {
                  if (state is BuildingAddSuccess) {
                    Navigator.pop(context);
                    showTopSnackBar(context, "Building added");
                  }
                },
                child: BlocBuilder<BuildingsBloc, BuildingsState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: CustomElevatedButton(
                        isLoading: state is BuildingAddLoading,
                        label: 'Add Building',
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await addBuilding();
                            // ignore: use_build_context_synchronously

                            // ignore: use_build_context_synchronously
                            // final startAndEndDate =
                            //     context.read<StartAndEndDateBloc>().state;
                            // _buildingNameController.clear();
                            // _floorController.clear();
                            // _unitPerFootController.clear();
                            // context.read<StartAndEndDateBloc>().add(
                            //     DateDetailsStartChanged(startDate: DateTime.now()));
                            // context
                            //     .read<StartAndEndDateBloc>()
                            //     .add(DateDetailsEndChanged(endDate: DateTime.now()));
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
