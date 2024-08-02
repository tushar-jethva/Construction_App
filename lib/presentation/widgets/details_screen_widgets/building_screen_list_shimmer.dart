import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyBuildingListShimmerWidget extends StatelessWidget {
  const MyBuildingListShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: theme.cardColor, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerBox(
                  height: 10,
                  width: 100,
                ),
                ShimmerBox(height: 10, width: 20)
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
                    valueColor: AlwaysStoppedAnimation<Color>(purple),
                  ),
                ),
                Gap(10.w),
                ShimmerBox(height: 5, width: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
