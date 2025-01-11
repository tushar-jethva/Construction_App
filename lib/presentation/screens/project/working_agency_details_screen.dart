import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:construction_mate/presentation/widgets/common/draggable_scrollable_sheet.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:dashed_line/dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyWorkingAgencyDetailsScreen extends StatefulWidget {
  final PerBuildingAgencyModel perBuildingAgency;
  const MyWorkingAgencyDetailsScreen(
      {super.key, required this.perBuildingAgency});

  @override
  State<MyWorkingAgencyDetailsScreen> createState() =>
      _MyWorkingAgencyDetailsScreenState();
}

class _MyWorkingAgencyDetailsScreenState
    extends State<MyWorkingAgencyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    PerBuildingAgencyModel perBuildingAgency = widget.perBuildingAgency;
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.cardColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: theme.canvasColor),
        title: Text(
          perBuildingAgency.nameOfAgency!,
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: Stack(
        children: [
          pricePerFootWidget(theme, perBuildingAgency),
          scrollableSheetWidget(context, theme)
        ],
      ),
    );
  }

  Widget pricePerFootWidget(
      ThemeData theme, PerBuildingAgencyModel perBuildingAgency) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Price per feet: ",
                style: theme.textTheme.titleMedium!
                    .copyWith(fontSize: 17, color: grey),
              ),
              Text(
                "₹ ${perBuildingAgency.pricePerFeet!}",
                style: theme.textTheme.titleLarge!.copyWith(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  DraggableScrollableSheetCommonComp scrollableSheetWidget(
      BuildContext context, ThemeData theme) {
    return DraggableScrollableSheetCommonComp(
      draggableScrollableController: DraggableScrollableController(),
      stops: const [0.8, 0.9],
      initialSize: 0.8,
      minChildSize: 0.8,
      radius: 20,
      newWidget: (context, scrollController) {
        PerBuildingAgencyModel perBuildingAgency = widget.perBuildingAgency;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: theme.scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Gap(30.h),
              Text("Assigned Floors:",
                  style: theme.textTheme.titleLarge!.copyWith(fontSize: 17)),
              Gap(10.h),
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: perBuildingAgency.floors!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.w,
                        mainAxisSpacing: 20.w,
                      ),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: theme.cardColor,
                              ),
                              child: Text(
                                perBuildingAgency.floors![index],
                                style: TextStyle(
                                    color: theme.canvasColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16),
                              ),
                            ),
                            10.hx,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: SizedBox(
                                height: 10,
                                child: DashedLine(
                                  path: Path()
                                    ..moveTo(0, 0)
                                    ..lineTo(300,
                                        0), // Creates a horizontal dashed line
                                  color: Colors.grey,

                                  dashSpace: 12, // Space between dashes
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
