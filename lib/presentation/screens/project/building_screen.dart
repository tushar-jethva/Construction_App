// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/data/datasource/transaction_data_source.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/controllers/BuildingAddBloc/buildings_bloc.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/building_card.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BuildingsScreen extends StatefulWidget {
  final ProjectModel project;
  final ScrollController scrollController;
  const BuildingsScreen(
      {super.key, required this.project, required this.scrollController});

  @override
  State<BuildingsScreen> createState() => _BuildingsScreenState();
}

class _BuildingsScreenState extends State<BuildingsScreen> {
  final TransactionRepository transactionRepository = TransactionRepositoryImpl(
      transactionDataSource: TransactionDataSourceImpl());

  late BuildingsBloc _buildingsBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _buildingsBloc = BlocProvider.of<BuildingsBloc>(context);
    // _buildingsBloc.add(LoadBuildings(projectId: widget.project.sId!));
  }

  Future<void> _refreshBuildings() async {
    _buildingsBloc.add(LoadBuildings(projectId: widget.project.sId!));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RefreshIndicator(
      onRefresh: _refreshBuildings,
      color: purple,
      child:
          BlocBuilder<BuildingsBloc, BuildingsState>(builder: (context, state) {
        if (state is BuildingsInitial || state is BuildingAddLoading) {
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
        } else if (state is BuildingsLoadSuccess) {
          return state.buildings.isEmpty
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: const Center(child: Text("No building founds!")))
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.73,
                  child: ListView.builder(
                      controller: widget.scrollController,
                      // primary: false,
                      itemCount: state.buildings.length,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        BuildingModel building = state.buildings[index];
                        return GestureDetector(
                            onTap: () {
                              context.pushNamed(
                                  RoutesName.buildingDetailsScreen,
                                  extra: {
                                    "buildingModel": building,
                                    "projectModel": widget.project
                                  });
                            },
                            child: MyBuildingListWidget(
                              building: building,
                              index: index,
                            ));
                      }),
                );
        } else {
          return const Center(child: Text('Failed to load projects'));
        }
      }),
    );
  }
}
