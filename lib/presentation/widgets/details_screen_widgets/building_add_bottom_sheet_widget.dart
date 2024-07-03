import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/controllers/StartAndEndDateBloc/start_and_end_date_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/custom_textfield.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class MyBuildingAddBottomSheetWidget extends StatefulWidget {
  MyBuildingAddBottomSheetWidget({super.key});

  @override
  State<MyBuildingAddBottomSheetWidget> createState() =>
      _MyBuildingAddBottomSheetWidgetState();
}

class _MyBuildingAddBottomSheetWidgetState
    extends State<MyBuildingAddBottomSheetWidget> {
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
    return Container(
      height: 400.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r))),
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
                BlocBuilder<StartAndEndDateBloc, StartAndEndDateState>(
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
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: grey,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<StartAndEndDateBloc, StartAndEndDateState>(
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
          MyCustomTextField(
            controller: _floorController,
            hintText: 'Project Description',
            maxLines: 3,
          ),
          Gap(20.h),
          MyCustomButton(
            buttonName: 'Add Building',
            color: green,
            style: const TextStyle(color: white, fontWeight: FontWeight.w500),
            onPressed: () {},
          ),
        ],
      ),
    );
    ;
  }
}
