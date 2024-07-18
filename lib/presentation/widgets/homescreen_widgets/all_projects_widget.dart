import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/ProjectListBloc/project_bloc.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AllProjectsWidget extends StatelessWidget {
  const AllProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        if (state is ProjectInitial) {
          return SliverToBoxAdapter(
            child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                    height: ReusableFunctions.getHeight(
                        context: context, height: 0.5),
                    child: const Center(child: CircularProgressIndicator()))),
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
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: greyLight,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(project.name!),
                              // Text((project.paymentIn! - project.paymentOut!)
                              //     .toString()),
                              IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.more_vert))
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
                                      AlwaysStoppedAnimation<Color>(purple),
                                ),
                              ),
                              Gap(10.w),
                              Text(
                                '${(0.2 * 100).toStringAsFixed(1)}%',
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.purple),
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
