// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/logic/controllers/BuildingAddBloc/buildings_bloc.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/building_add_bottom_sheet_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/building_card.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';

class BuildingsScreen extends StatefulWidget {
  final ProjectModel project;
  const BuildingsScreen({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  State<BuildingsScreen> createState() => _BuildingsScreenState();
}

class _BuildingsScreenState extends State<BuildingsScreen> {
  openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return MyBuildingAddBottomSheetWidget(
            project: widget.project,
          );
        });
  }

  late BuildingsBloc _buildingsBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _buildingsBloc = BlocProvider.of<BuildingsBloc>(context);
    _buildingsBloc.add(LoadBuildings(projectId: widget.project.sId!));
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
            return Expanded(
                child: const Center(child: CircularProgressIndicator()));
          } else if (state is BuildingsLoadSuccess) {
            return state.buildings.isEmpty
                ? Expanded(
                    child: const Center(child: Text("No building founds")))
                : Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.buildings.length,
                        itemBuilder: (context, index) {
                          BuildingModel building = state.buildings[index];
                          return InkWell(
                              onTap: () {
                                context.pushNamed(
                                    RoutesName.buildingDetailsScreen,
                                    extra: {"buildingModel":building,"projectModel":widget.project});
                              },
                              child: MyBuildingListWidget(building: building));
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
