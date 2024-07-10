import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/logic/controllers/BuildingAddBloc/buildings_bloc.dart';
import 'package:construction_mate/logic/controllers/StartAndEndDateBloc/start_and_end_date_bloc.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class MyBuildingAddBottomSheetWidget extends StatefulWidget {
  const MyBuildingAddBottomSheetWidget({super.key});

  @override
  State<MyBuildingAddBottomSheetWidget> createState() =>
      _MyBuildingAddBottomSheetWidgetState();
}

class _MyBuildingAddBottomSheetWidgetState
    extends State<MyBuildingAddBottomSheetWidget> {
  final TextEditingController _buildingNameController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _unitPerFootController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  dispose() {
    super.dispose();
    _buildingNameController.dispose();
    _floorController.dispose();
    _unitPerFootController.dispose();
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
      dateBloc.add(DateDetailsStartChanged(startDate: picked));
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
      dateBloc.add(DateDetailsEndChanged(endDate: picked));
    }
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: Container(
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyCustomTextFormField(
                      controller: _buildingNameController,
                      hintText: 'Building Name',
                      maxLines: 1,
                      textInputType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter building name!';
                        }
                      },
                    ),
                    Gap(15.h),
                    Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 15.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: grey,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<StartAndEndDateBloc,
                              StartAndEndDateState>(
                            builder: (context, state) {
                              final String formattedDate =
                                  DateFormat.yMMMd().format(state.startDate);
                              return Text("Start Date: $formattedDate");
                            },
                          ),
                          InkWell(
                              onTap: () {
                                _selectDateStart(context);
                              },
                              child: const Icon(Icons.calendar_month))
                        ],
                      ),
                    ),
                    Gap(15.h),
                    Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 15.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: grey,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<StartAndEndDateBloc,
                              StartAndEndDateState>(
                            builder: (context, state) {
                              final String formattedDate =
                                  DateFormat.yMMMd().format(state.endDate);
                              return Text(
                                "End Date: $formattedDate",
                              );
                            },
                          ),
                          InkWell(
                              onTap: () {
                                _selectDateEnd(context);
                              },
                              child: const Icon(Icons.calendar_month))
                        ],
                      ),
                    ),
                    Gap(15.h),
                    MyCustomTextFormField(
                      controller: _floorController,
                      textInputType: TextInputType.number,
                      hintText: "Add floors",
                      maxLines: 1,
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
                      },
                    ),
                    Gap(20.h),
                    MyCustomTextFormField(
                      controller: _unitPerFootController,
                      textInputType: TextInputType.number,
                      hintText: 'Unit per floor',
                      maxLines: 1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please add foot per floor!';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter valid digit!';
                        }
                        if (value.startsWith('-')) {
                          return 'Please enter valid digit!';
                        }
                      },
                    ),
                  ],
                ),
              ),
              Gap(20.h),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: MyCustomButton(
                  buttonName: 'Add Building',
                  color: green,
                  style: const TextStyle(
                      color: white, fontWeight: FontWeight.w500),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final startAndEndDate =
                          context.read<StartAndEndDateBloc>().state;
                      buildings.add(BuildingModel(
                          buildingName: _buildingNameController.text,
                          startDate: startAndEndDate.startDate.toString(),
                          endDate: startAndEndDate.endDate.toString(),
                          noOfFloors: int.parse(_floorController.text),
                          unitPerFloor:
                              double.parse(_unitPerFootController.text)));
                      context.read<BuildingsBloc>().add(LoadBuildings(
                          buildings: buildings.reversed.toList()));

                      _buildingNameController.clear();
                      _floorController.clear();
                      _unitPerFootController.clear();
                      context.read<StartAndEndDateBloc>().add(
                          DateDetailsStartChanged(startDate: DateTime.now()));
                      context
                          .read<StartAndEndDateBloc>()
                          .add(DateDetailsEndChanged(endDate: DateTime.now()));

                      context.pop();
                    }
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
