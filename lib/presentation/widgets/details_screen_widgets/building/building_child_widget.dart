import 'package:construction_mate/logic/controllers/Building-by-id/building_by_id_bloc.dart';
import 'package:construction_mate/logic/controllers/FloorNameAndFeet/floor_name_and_feet_bloc.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/screens/project/project_screen.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/building_add_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildingChildWidget extends StatelessWidget {
  const BuildingChildWidget({super.key});

  openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => FloorNameAndFeetBloc(),
            child: BlocBuilder<BuildingByIdBloc, BuildingByIdState>(
              builder: (context, state) {
                return MyBuildingAddBottomSheetWidget(
                  project: state.project ?? ProjectModel(),
                );
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: CommonButton2(
          buttonName: 'Building',
          onTap: () {
            openBottomSheet(context: context);
          }),
    );
  }
}
