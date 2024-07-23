import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(perBuildingAgency.nameOfAgency!),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Price per feet: ",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Text(
                  "${perBuildingAgency.pricePerFeet!} \$",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Gap(20.h),
            Text("Assigned Floors:",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            Gap(20.h),
            Expanded(
              child: GridView.builder(
                  itemCount: perBuildingAgency.floors!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 20.w,
                      mainAxisExtent: 125),
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: grey,
                      ),
                      child: Text(
                        "${perBuildingAgency.floors![index]} floor",
                        style: const TextStyle(
                            color: white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
