import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/widgets/building_details_screen.dart/agency_widget.dart';
import 'package:flutter/material.dart';

class MyBuildingDetailsScreen extends StatefulWidget {
  final BuildingModel buildingModel;
  final ProjectModel projectModel;
  const MyBuildingDetailsScreen({super.key, required this.buildingModel, required this.projectModel});

  @override
  State<MyBuildingDetailsScreen> createState() =>
      _MyBuildingDetailsScreenState();
}

class _MyBuildingDetailsScreenState extends State<MyBuildingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.buildingModel.name!),
            bottom: TabBar(
              onTap: (index) {},
              tabs: const [
                Tab(text: 'Progress'),
                Tab(text: 'Agencies'),
              ],
            ),
          ),
          body:  TabBarView(
            children: [
              const Center(child: Text('Site Progress Tab')),
              MyPerBuildingAgency(buildingModel: widget.buildingModel,projectModel: widget.projectModel,)
            ],
          ),
        ));
  }
}
