import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/custom_textfield.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class BuildingsScreen extends StatefulWidget {
  const BuildingsScreen({
    super.key,
  });

  @override
  State<BuildingsScreen> createState() => _BuildingsScreenState();
}

class _BuildingsScreenState extends State<BuildingsScreen> {
  final TextEditingController _buildingNameController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _unitPerFootController = TextEditingController();

  @override
  dispose() {
    super.dispose();
    _buildingNameController.dispose();
    _floorController.dispose();
    _unitPerFootController.dispose();
  }

  Future<void> _selectDateStart(BuildContext context) async {
    final DateBlocBloc dateBloc = BlocProvider.of<DateBlocBloc>(context);
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
    final DateBlocBloc dateBloc = BlocProvider.of<DateBlocBloc>(context);
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

  openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 400.h,
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
                  controller: _buildingNameController,
                  hintText: 'Project Name',
                  maxLines: 1,
                ),
                Gap(15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                          BlocBuilder<DateBlocBloc, DateBlocState>(
                            builder: (context, state) {
                              final String formattedDate =
                                  DateFormat.yMMMd().format(DateTime.now());
                              if (state is DateBlocDetailsStartState) {
                                final String formattedDate =
                                    DateFormat.yMMMd().format(state.startDate);
                                return Text("Start: $formattedDate");
                              }
                              return Text("Start: $formattedDate");
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
                          BlocBuilder<DateBlocBloc, DateBlocState>(
                            builder: (context, state) {
                              final String formattedDate =
                                  DateFormat.yMMMd().format(DateTime.now());
                              if (state is DateBlocDetailsEndState) {
                                final String formattedDate =
                                    DateFormat.yMMMd().format(state.endDate);
                                return Text(
                                  formattedDate,
                                );
                              }
                              return Text("End:  $formattedDate");
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
                  ],
                ),
                Gap(15.h),
                MyCustomTextField(
                  controller: _floorController,
                  hintText: 'Project Description',
                  maxLines: 3,
                ),
                Gap(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyCustomButton(
                      buttonName: 'Add Building',
                      color: green,
                      style: const TextStyle(
                          color: white, fontWeight: FontWeight.w500),
                      onPressed: () {},
                    ),
                    MyCustomButton(
                      buttonName: 'Next',
                      color: green,
                      style: const TextStyle(
                          color: white, fontWeight: FontWeight.w500),
                      onPressed: () {
                        context.goNamed(RoutesName.detailsScreen);
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Buildings",
                  style: TextStyle(
                      color: black, fontWeight: FontWeight.w500, fontSize: 14),
                ),
                MyCustomButton(
                    buttonName: '+ Add Building',
                    color: transparent,
                    style: const TextStyle(
                        fontSize: 16,
                        color: purple,
                        fontWeight: FontWeight.bold),
                    onPressed: () {
                      openBottomSheet(context: context);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
