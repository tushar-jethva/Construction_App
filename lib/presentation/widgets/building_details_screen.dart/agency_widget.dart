import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/data/datasource/agency_data_source.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/logic/controllers/PerBuildingAgency/per_building_agencies_bloc.dart';
import 'package:construction_mate/logic/controllers/SelectFloorsBloc/select_floors_bloc.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/screens/project/project_screen.dart';
import 'package:construction_mate/presentation/widgets/building_details_screen.dart/add_agency_bottom_sheet.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../common/draggable_scrollable_sheet.dart';

class MyPerBuildingAgency extends StatefulWidget {
  final BuildingModel buildingModel;
  final ProjectModel projectModel;
  const MyPerBuildingAgency(
      {super.key, required this.buildingModel, required this.projectModel});

  @override
  State<MyPerBuildingAgency> createState() => _MyPerBuildingAgencyState();
}

class _MyPerBuildingAgencyState extends State<MyPerBuildingAgency> {
  openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (_) => SelectFloorsBloc(AgencyRepositoryImpl(
                agencyDataSource: AgencyDataSourceDataSourceImpl())),
            child: MyAddAgencyBottomSheet(
              buildingModel: widget.buildingModel,
              projectModel: widget.projectModel,
            ),
          );
        });
  }

  late PerBuildingAgenciesBloc perBuildingAgenciesBloc;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    perBuildingAgenciesBloc = BlocProvider.of<PerBuildingAgenciesBloc>(context);

    perBuildingAgenciesBloc.add(LoadAgencies(
        projectId: widget.projectModel.sId!,
        buildingId: widget.buildingModel.sId!));
  }

  Future<void> _onRefreshAgencies() async {
    perBuildingAgenciesBloc.add(LoadAgencies(
        projectId: widget.projectModel.sId!,
        buildingId: widget.buildingModel.sId!));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return scrollableSheetWidget(context, theme);
  }

  RefreshIndicator agencyWidget(ThemeData theme, BuildContext context,
      ScrollController scrollController) {
    return RefreshIndicator(
      onRefresh: _onRefreshAgencies,
      child: Column(
        children: [
          addAgencyWidgeet(theme, context),
          availableAgencyWidget(
            theme,
          )
        ],
      ),
    );
  }

  BlocBuilder<PerBuildingAgenciesBloc, PerBuildingAgenciesState>
      availableAgencyWidget(ThemeData theme) {
    return BlocBuilder<PerBuildingAgenciesBloc, PerBuildingAgenciesState>(
        builder: (context, state) {
      if (state is PerBuildingAgenciesInitial) {
        return Shimmer(
          gradient: LinearGradient(
              colors: [theme.hoverColor, theme.cardColor], stops: [0.1, 0.8]),
          child: ListView.builder(
              shrinkWrap: true,
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
      } else if (state is PerBuildingAgenciesSuccess) {
        return state.agencies.isEmpty
            ? const Expanded(
                child: Center(
                  child: Text("No agencies found!"),
                ),
              )
            : Expanded(
                child: ListView.builder(
                    itemCount: state.agencies.length,
                    itemBuilder: (context, index) {
                      PerBuildingAgencyModel agency = state.agencies[index];
                      return InkWell(
                        onTap: () {
                          context.pushNamed(
                              RoutesName.workingAgencyDetailsScreen,
                              extra: agency);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 5.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        agency.nameOfAgency ?? "",
                                        style: theme.textTheme.titleLarge
                                            ?.copyWith(fontSize: 16),
                                      ),
                                      Text(
                                        agency.workType ?? "",
                                        style: theme.textTheme.titleMedium
                                            ?.copyWith(
                                                fontSize: 14, color: grey),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Price: ",
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                                    fontSize: 14, color: grey),
                                          ),
                                          Text(
                                            "₹ ${agency.pricePerFeet}",
                                            style: theme.textTheme.titleLarge
                                                ?.copyWith(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Given Floors: ",
                                            style: theme.textTheme.titleMedium
                                                ?.copyWith(
                                                    fontSize: 14, color: grey),
                                          ),
                                          Text(
                                            agency.floors!.length.toString(),
                                            style: theme.textTheme.titleLarge
                                                ?.copyWith(fontSize: 15),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Divider()
                            ],
                          ),
                        ),
                      );
                    }),
              );
      } else {
        return const Center(child: Text('Failed to load projects'));
      }
    });
  }

  Padding addAgencyWidgeet(ThemeData theme, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CommonButton2(
              buttonName: 'Agency',
              onTap: () {
                openBottomSheet(context: context);
              }),
        ],
      ),
    );
  }

  Widget scrollableSheetWidget(BuildContext context, ThemeData theme) {
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          addAgencyWidgeet(theme, context),
          availableAgencyWidget(theme)
        ],
      ),
    );
  }
}
