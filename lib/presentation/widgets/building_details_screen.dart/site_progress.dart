import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/data/datasource/site_progress_data_source.dart';
import 'package:construction_mate/data/repository/site_progress_repository.dart';
import 'package:construction_mate/logic/controllers/SiteProgressAgencyUpdate/site_progress_agency_update_bloc.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/floor_site_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';
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

  Future<void> _onRefreshAgencies() async {
    siteProgressFloorsBloc.add(LoadFloorsSite(
        projectId: widget.projectModel.sId!,
        buildingId: widget.buildingModel.sId!));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<SiteProgressFloorsBloc, SiteProgressFloorsState>(
      builder: (context, state) {
        if (state is SiteProgressFloorsInitial) {
          return Shimmer(
            gradient: LinearGradient(
                colors: [theme.hoverColor, theme.cardColor],
                stops: const [0.1, 0.8]),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
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
          );
        } else if (state is SiteProgressFloorsSuccess) {
          return ListView.builder(
              itemCount: state.listOfFloorsSite.length,
              itemBuilder: (context, index) {
                FloorSiteModel floorSiteModel = state.listOfFloorsSite[index];
                String formattedDate = DateFormat('dd-MM-yyyy  hh:mm')
                    .format(DateTime.parse(floorSiteModel.completedDate!));

                return InkWell(
                  onTap: () {
                    context
                        .pushNamed(RoutesName.siteProgressDeailsScreen, extra: {
                      'floorSiteModel': floorSiteModel,
                    });
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Floor No. ${floorSiteModel.floorIndex}"),
                              Text(
                                  "Total agencies: ${floorSiteModel.workStatus!.length}")
                            ],
                          ),
                          Text("Updated last: $formattedDate")
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else {
          return const Center(
            child: Text("Something gone wrong!"),
          );
        }
      },
    );
  }
}
