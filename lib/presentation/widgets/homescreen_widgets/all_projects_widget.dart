import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/ProjectListBloc/project_bloc.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class AllProjectsWidget extends StatelessWidget {
  const AllProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        if (state is ProjectInitial || state is ProjectAddLoading) {
          return SliverToBoxAdapter(
            child: Shimmer(
              gradient: LinearGradient(
                  colors: [baseColor, highlightColor], stops: const [0.1, 0.8]),
              child: SingleChildScrollView(
                child: ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 8),
                        child: Container(
                          height: ReusableFunctions.getHeight(
                              context: context, height: 0.12),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: greyLight,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ShimmerBox(height: 10, width: 200),
                                  Icon(Icons.more_vert)
                                ],
                              ),
                              Gap(10.h),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 10,
                                    width: ReusableFunctions.getwidth(
                                        context: context, width: 0.6),
                                    child: LinearProgressIndicator(
                                      borderRadius: BorderRadius.circular(10),
                                      value: 0.2,
                                      backgroundColor: Colors.white,
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                              purple),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        } else if (state is ProjectLoadSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                ProjectModel project = state.projects[index];
                return InkWell(
                  onTap: () {
                    context.pushNamed(RoutesName.projectDetailsScreen,
                        extra: project);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: greyLight,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                project.name!,
                                style: theme.textTheme.titleMedium,
                              ),
                              // Text((project.paymentIn! - project.paymentOut!)
                              //     .toString()),
                              PopupMenuButton(
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                      child: TextButton(
                                          onPressed: () {},
                                          child: const Text("Update"))),
                                  PopupMenuItem(
                                      child: TextButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return SimpleDialog(
                                                    backgroundColor: white,
                                                    children: [
                                                      SizedBox(
                                                        height: 130.h,
                                                        child: Column(
                                                          children: [
                                                            const Center(
                                                              child: Text(
                                                                "Are you sure?",
                                                                style: TextStyle(
                                                                    color:
                                                                        black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        16),
                                                              ),
                                                            ),
                                                            const Center(
                                                              child: Text(
                                                                  "Do you want to delete it?"),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                MyCustomButton(
                                                                    buttonName:
                                                                        'Delete',
                                                                    color: red,
                                                                    style: const TextStyle(
                                                                        color:
                                                                            white),
                                                                    onPressed:
                                                                        () {}),
                                                                MyCustomButton(
                                                                    buttonName:
                                                                        'Cancel',
                                                                    color:
                                                                        green,
                                                                    style: const TextStyle(
                                                                        color:
                                                                            white),
                                                                    onPressed:
                                                                        () {}),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                          child: const Text("Delete")))
                                ],
                                icon: Icon(
                                  Icons.more_vert_rounded,
                                  color: theme.canvasColor,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 10,
                                width: ReusableFunctions.getwidth(
                                    context: context, width: 0.6),
                                child: LinearProgressIndicator(
                                  borderRadius: BorderRadius.circular(10),
                                  value: 0.2,
                                  backgroundColor: Colors.white,
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          purple),
                                ),
                              ),
                              Gap(10.w),
                              Text(
                                '${(0.2 * 100).toStringAsFixed(1)}%',
                                style: theme.textTheme.titleMedium!
                                    .copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: state.projects.length,
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: Text('Failed to load projects')),
          );
        }
      },
    );
  }
}
