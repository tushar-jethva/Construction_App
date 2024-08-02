import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyBuildingListWidget extends StatelessWidget {
  final BuildingModel building;
  const MyBuildingListWidget({super.key, required this.building});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: greyLight, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  building.name!,
                  style: TextStyle(fontSize: 14.sp),
                ),
                Text("Floors: ${building.totalFloor.toString()}")
              ],
            ),
            Gap(10.h),
            Row(
              children: [
                SizedBox(
                  height: 7,
                  width:
                      ReusableFunctions.getwidth(context: context, width: 0.6),
                  child: LinearProgressIndicator(
                    borderRadius: BorderRadius.circular(10),
                    value: 0.2,
                    backgroundColor: Colors.white,
                    valueColor: const AlwaysStoppedAnimation<Color>(purple),
                  ),
                ),
                Gap(10.w),
                Text(
                  '${(0.2 * 100).toStringAsFixed(1)}%',
                  style: theme.textTheme.titleMedium!.copyWith(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
