import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/controllers/BuildingAddBloc/buildings_bloc.dart';
import 'package:construction_mate/logic/controllers/PerBuildingAgency/per_building_agencies_bloc.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:construction_mate/presentation/widgets/building_details_screen.dart/add_agency_bottom_sheet.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPerBuildingAgency extends StatelessWidget {
  final BuildingModel buildingModel;

  const MyPerBuildingAgency({super.key, required this.buildingModel});

  openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return MyAddAgencyBottomSheet(
            buildingModel: buildingModel,
          );
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
                "Agencies",
                style: TextStyle(
                    color: black, fontWeight: FontWeight.w500, fontSize: 14),
              ),
              MyCustomButton(
                  buttonName: '+ Add Agency',
                  color: transparent,
                  style: const TextStyle(
                      fontSize: 16, color: purple, fontWeight: FontWeight.bold),
                  onPressed: () {
                    openBottomSheet(context: context);
                  }),
            ],
          ),
        ),
        BlocBuilder<PerBuildingAgenciesBloc, PerBuildingAgenciesState>(
            builder: (context, state) {
          if (state is PerBuildingAgenciesInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PerBuildingAgenciesSuccess) {
            return Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.agencies.length,
                  itemBuilder: (context, index) {
                    PerBuildingAgencyModel agency = state.agencies[index];
                    return InkWell(onTap: () {}, child: Container());
                  }),
            );
          } else {
            return const Center(child: Text('Failed to load projects'));
          }
        })
      ],
    );
  }
}
