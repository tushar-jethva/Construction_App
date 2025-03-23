import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/floor_site_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/widgets/common/draggable_scrollable_sheet.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:construction_mate/logic/controllers/SiteProgressFloorBloc/site_progress_floors_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class MySiteProgressScreenWidget extends StatefulWidget {
  final BuildingModel buildingModel;
  final ProjectModel projectModel;
  const MySiteProgressScreenWidget(
      {super.key, required this.buildingModel, required this.projectModel});

  @override
  State<MySiteProgressScreenWidget> createState() =>
      _MySiteProgressScreenWidgetState();
}

class _MySiteProgressScreenWidgetState
    extends State<MySiteProgressScreenWidget> {
  late SiteProgressFloorsBloc siteProgressFloorsBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    siteProgressFloorsBloc = BlocProvider.of<SiteProgressFloorsBloc>(context);

    siteProgressFloorsBloc.add(LoadFloorsSite(
        projectId: widget.projectModel.sId!,
        buildingId: widget.buildingModel.sId!));
  }

  // ignore: unused_element
  Future<void> _onRefreshAgencies() async {
    siteProgressFloorsBloc.add(LoadFloorsSite(
        projectId: widget.projectModel.sId!,
        buildingId: widget.buildingModel.sId!));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: theme.scaffoldBackgroundColor,
        child: floorsWidget(theme));
  }

  BlocBuilder<SiteProgressFloorsBloc, SiteProgressFloorsState> floorsWidget(
      ThemeData theme) {
    return BlocBuilder<SiteProgressFloorsBloc, SiteProgressFloorsState>(
      builder: (context, state) {
        if (state is SiteProgressFloorsInitial) {
          return Shimmer(
            gradient: LinearGradient(
                colors: [theme.hoverColor, theme.cardColor],
                stops: const [0.1, 0.8]),
            child: SizedBox(
              height: 300,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 5.h),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10.h),
                          decoration: BoxDecoration(
                              color: theme.cardColor,
                              borderRadius: BorderRadius.circular(15.r)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ShimmerBox(height: 10, width: 150),
                                  Gap(10),
                                  ShimmerBox(height: 10, width: 90)
                                ],
                              ),
                              Column(
                                children: [
                                  ShimmerBox(height: 5, width: 10),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          );
        } else if (state is SiteProgressFloorsSuccess) {
          return state.listOfFloorsSite.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: ListView.builder(
                      itemCount: state.listOfFloorsSite.length,
                      itemBuilder: (context, index) {
                        FloorSiteModel floorSiteModel =
                            state.listOfFloorsSite[index];
                        String formattedDate = DateFormat('dd-MM-yyyy  hh:mm')
                            .format(
                                DateTime.parse(floorSiteModel.completedDate!));

                        return InkWell(
                          onTap: () {
                            context.pushNamed(
                                RoutesName.siteProgressDeailsScreen,
                                extra: {
                                  'floorSiteModel': floorSiteModel,
                                });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${floorSiteModel.floorName}",
                                      style: theme.textTheme.titleLarge
                                          ?.copyWith(fontSize: 16),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Total agencies: ",
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(
                                                  fontSize: 12, color: grey),
                                        ),
                                        Text(
                                          floorSiteModel.workStatus?.length
                                                  .toString() ??
                                              "0",
                                          style: theme.textTheme.titleMedium
                                              ?.copyWith(fontSize: 12),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Completed agencies: ",
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(fontSize: 12, color: grey),
                                    ),
                                    Text(
                                      "${floorSiteModel.completedAgenciesCount ?? 0}",
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                              fontSize: 12, color: green),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Progress: ",
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(fontSize: 12, color: grey),
                                    ),
                                    Text(
                                      "${floorSiteModel.progress ?? 0}%",
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                              fontSize: 12, color: green),
                                    )
                                  ],
                                ),
                                5.hx,
                                Row(
                                  children: [
                                    Text(
                                      "Last updated: ",
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(fontSize: 10, color: grey),
                                    ),
                                    Text(
                                      formattedDate,
                                      style:
                                          theme.textTheme.titleMedium?.copyWith(
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider()
                              ],
                            ),
                          ),
                        );
                      }),
                )
              : const Center(
                  child: Text("No floors found!"),
                );
        } else {
          return const Center(
            child: Text("Something gone wrong!"),
          );
        }
      },
    );
  }

  DraggableScrollableSheetCommonComp scrollableSheetWidget(
      BuildContext context, ThemeData theme) {
    return DraggableScrollableSheetCommonComp(
      draggableScrollableController: DraggableScrollableController(),
      stops: const [0.98, 0.99],
      initialSize: 0.98,
      minChildSize: 0.98,
      radius: 20,
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [floorsWidget(theme)],
        ),
      ),
    );
  }
}
