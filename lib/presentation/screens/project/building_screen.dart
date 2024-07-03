import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/building_add_bottom_sheet_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildingsScreen extends StatefulWidget {
  const BuildingsScreen({
    super.key,
  });

  @override
  State<BuildingsScreen> createState() => _BuildingsScreenState();
}

class _BuildingsScreenState extends State<BuildingsScreen> {
  openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const MyBuildingAddBottomSheetWidget();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                      fontSize: 16, color: purple, fontWeight: FontWeight.bold),
                  onPressed: () {
                    openBottomSheet(context: context);
                  })
            ],
          ),
        )
      ],
    );
  }
}
