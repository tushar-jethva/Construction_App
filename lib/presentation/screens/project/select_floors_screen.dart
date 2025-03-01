// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/data/datasource/agency_data_source.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/logic/controllers/SelectFloorsBloc/select_floors_bloc.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:go_router/go_router.dart';

class MySelectFloorsScreen extends StatefulWidget {
  final BuildingModel buildingModel;
  final ProjectModel projectModel;
  final String workTypeId;
  final SelectFloorsBloc selectFloorsBloc;
  const MySelectFloorsScreen({
    super.key,
    required this.buildingModel,
    required this.projectModel,
    required this.workTypeId,
    required this.selectFloorsBloc,
  });

  @override
  State<MySelectFloorsScreen> createState() => _MySelectFloorsScreenState();
}

class _MySelectFloorsScreenState extends State<MySelectFloorsScreen> {
  final AgencyRepository agencyRepository =
      AgencyRepositoryImpl(agencyDataSource: AgencyDataSourceDataSourceImpl());

  @override
  void initState() {
    super.initState();
    widget.selectFloorsBloc.add(FetchSelectedFloorsEvent(
        buildingId: widget.buildingModel.sId!,
        projectId: widget.projectModel.sId!,
        workTypeId: widget.workTypeId));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider.value(
      value: widget.selectFloorsBloc,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: theme.canvasColor),
          backgroundColor: theme.scaffoldBackgroundColor,
          title: Text("Select Floors", style: theme.textTheme.titleLarge),
        ),
        body: Column(
          children: [
            BlocBuilder<SelectFloorsBloc, SelectFloorsState>(
              builder: (context, state) {
                if (!state.isLoading) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                          itemCount: widget.buildingModel.totalFloor,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20.w,
                                  mainAxisSpacing: 20.w,
                                  mainAxisExtent: 125),
                          itemBuilder: (context, index) {
                            if (state.selectedFloorList[index].isCompleted!) {
                              return GestureDetector(
                                onTap: () {
                                  showTopSnackBar(context, "Already given");
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    color: grey,
                                  ),
                                  child: Text(
                                    "${state.selectedFloorList[index].floorName}",
                                    style: theme.textTheme.titleMedium!
                                        .copyWith(fontSize: 16),
                                  ),
                                ),
                              );
                            }
                            if (state.floorList.contains(
                                state.selectedFloorList[index].floorName)) {
                              return GestureDetector(
                                onTap: () {
                                  context.read<SelectFloorsBloc>().add(
                                      RemoveFloorEvent(
                                          floor: state.selectedFloorList[index]
                                              .floorName!));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: purple,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Text(
                                    "${state.selectedFloorList[index].floorName}",
                                    style: theme.textTheme.titleMedium!
                                        .copyWith(fontSize: 16),
                                  ),
                                ),
                              );
                            }
                            return GestureDetector(
                              onTap: () {
                                context.read<SelectFloorsBloc>().add(
                                    AddFloorEvent(
                                        floor: state.selectedFloorList[index]
                                            .floorName!));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: theme.cardColor,
                                ),
                                child: Text(
                                  "${state.selectedFloorList[index].floorName}",
                                  style: theme.textTheme.titleMedium!
                                      .copyWith(fontSize: 16),
                                ),
                              ),
                            );
                          }),
                    ),
                  );
                }
                return Center(child: ReusableFunctions.loader());
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
              child: CustomElevatedButton(
                onTap: () {
                  context.pop();
                },
                label: 'Done',
              ),
            )
          ],
        ),
      ),
    );
  }
}
