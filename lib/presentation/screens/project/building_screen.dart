import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/BuildingAddBloc/buildings_bloc.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/building_add_bottom_sheet_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

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
        isScrollControlled: true,
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
                  }),
            ],
          ),
        ),
        BlocBuilder<BuildingsBloc, BuildingsState>(builder: (context, state) {
          if (state is BuildingsInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BuildingsLoadSuccess) {
            return Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.buildings.length,
                  itemBuilder: (context, index) {
                    BuildingModel building = state.buildings[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: greyLight,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(building.buildingName),
                                Text(building.noOfFloors.toString())
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 10,
                                  width: ReusableFunctions.getwidth(
                                      context: context, width: 0.6),
                                  child: LinearProgressIndicator(
                                    borderRadius: BorderRadius.circular(10),
                                    value: 0.2,
                                    backgroundColor: Colors.white,
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                            purple),
                                  ),
                                ),
                                Gap(10.w),
                                Text(
                                  '${(0.2 * 100).toStringAsFixed(1)}%',
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.purple),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return Center(child: Text('Failed to load projects'));
          }
        })
      ],
    );
  }
}
