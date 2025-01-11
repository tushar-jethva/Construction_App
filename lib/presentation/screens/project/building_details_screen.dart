import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/widgets/building_details_screen.dart/agency_widget.dart';
import 'package:construction_mate/presentation/widgets/building_details_screen.dart/site_progress.dart';
import 'package:flutter/material.dart';

class MyBuildingDetailsScreen extends StatefulWidget {
  final BuildingModel buildingModel;
  final ProjectModel projectModel;
  const MyBuildingDetailsScreen(
      {super.key, required this.buildingModel, required this.projectModel});

  @override
  State<MyBuildingDetailsScreen> createState() =>
      _MyBuildingDetailsScreenState();
}

class _MyBuildingDetailsScreenState extends State<MyBuildingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: theme.cardColor,
          appBar: AppBar(
            iconTheme: IconThemeData(color: theme.canvasColor),
            backgroundColor: theme.scaffoldBackgroundColor,
            title: Text(
              widget.buildingModel.name!,
              style: theme.textTheme.titleLarge,
            ),
            bottom: TabBar(
              onTap: (index) {},
              labelColor: purple,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.zero,
              dividerColor: grey,
              dividerHeight: 3,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              unselectedLabelColor: greyELight,
              indicatorColor: purple,
              tabs: const [
                Tab(text: 'Progress'),
                Tab(text: 'Agencies'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MySiteProgressScreenWidget(
                  buildingModel: widget.buildingModel,
                  projectModel: widget.projectModel),
              MyPerBuildingAgency(
                buildingModel: widget.buildingModel,
                projectModel: widget.projectModel,
              )
            ],
          ),
        ));
  }
}
