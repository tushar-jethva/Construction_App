import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/data/datasource/agency_data_source.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/logic/controllers/PerBuildingAgency/per_building_agencies_bloc.dart';
import 'package:construction_mate/logic/controllers/SelectFloorsBloc/select_floors_bloc.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/widgets/building_details_screen.dart/add_agency_bottom_sheet.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPerBuildingAgency extends StatelessWidget {
  final BuildingModel buildingModel;
  final ProjectModel projectModel;
  const MyPerBuildingAgency(
      {super.key, required this.buildingModel, required this.projectModel});

  openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (_) => SelectFloorsBloc(AgencyRepositoryImpl(
                agencyDataSource: AgencyDataSourceDataSourceImpl())),
            child: MyAddAgencyBottomSheet(
              buildingModel: buildingModel,
              projectModel: projectModel,
            ),
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
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 5.h),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          decoration: BoxDecoration(
                              color: greyLight,
                              borderRadius: BorderRadius.circular(15.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(agency.nameOfAgency),
                                  Text(agency.workType)
                                ],
                              ),
                              Column(
                                children: [
                                  Text(agency.pricePerFeet.toString()),
                                  Text(agency.floors.length.toString())
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
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
