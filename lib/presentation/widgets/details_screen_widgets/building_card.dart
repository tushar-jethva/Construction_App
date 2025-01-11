import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/presentation/widgets/common/common_icon_circle_widget.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class MyBuildingListWidget extends StatelessWidget {
  final BuildingModel building;
  final int index;
  const MyBuildingListWidget(
      {super.key, required this.building, required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            IconCircleWidget(
              radius: 10,
              padding: const EdgeInsets.all(15),
              backgroundColor: theme.cardColor,
              imagewidget: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    buildIcons[index % buildIcons.length],
                    color: theme.canvasColor,
                    height: 25,
                  )),
            ),
            10.wx,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  building.name ?? "",
                  style: theme.textTheme.titleLarge?.copyWith(fontSize: 16),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 5,
                      width: ReusableFunctions.getwidth(
                          context: context, width: 0.6),
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(10),
                        value: 0.2,
                        backgroundColor: theme.cardColor,
                        valueColor: AlwaysStoppedAnimation<Color>(purple),
                      ),
                    ),
                    Gap(10.w),
                    Text(
                      '${(0.2 * 100).toStringAsFixed(1)}%',
                      style:
                          theme.textTheme.titleMedium!.copyWith(fontSize: 14),
                    ),
                  ],
                ),
                Text("Floors: ${building.totalFloor.toString()}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
