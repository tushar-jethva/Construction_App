import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/PaymentOutDropDownBloc/payment_out_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/ProjectListBloc/project_bloc.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/widgets/common/common_icon_circle_widget.dart';
import 'package:construction_mate/presentation/widgets/common/pop_up_menu_widget.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/project_add_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class AllProjectsWidget extends StatelessWidget {
  final ScrollController scrollController;
  const AllProjectsWidget({super.key, required this.scrollController});

  openBottomSheet(
      {required BuildContext context, required ProjectModel project}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return MyProjectAddBottomSheet(
            isUpdate: true,
            project: project,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        if (state is ProjectInitial || state is ProjectAddLoading) {
          return Shimmer(
            gradient: LinearGradient(
                colors: [theme.hoverColor, theme.cardColor],
                stops: const [0.1, 0.8]),
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
                            color: theme.cardColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        AlwaysStoppedAnimation<Color>(purple),
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
          );
        } else if (state is ProjectLoadSuccess) {
          return state.projects.isNotEmpty
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.66,
                  child: ListView.builder(
                    controller: scrollController,
                    // physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemCount: state.projects.length,
                    itemBuilder: (context, index) {
                      ProjectModel project = state.projects[index];
                      return GestureDetector(
                        onTap: () {
                          context.read<PaymentOutDropDownBloc>().add(
                                AgencyTypeChangeEvent(
                                    partyType: PartyType.SubContractor),
                              );
                          context.pushNamed(RoutesName.NEW_DETAIL_SCREEN_NAME,
                              extra: project);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10),
                          child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: IconCircleWidget(
                                radius: 10,
                                backgroundColor: theme.cardColor,
                                imagewidget: SvgPicture.asset(
                                  buildIcons[index % buildIcons.length],
                                  color: theme.canvasColor,
                                ),
                              ),
                              title: Text(
                                project.name ?? '',
                                style: theme.textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Row(
                                children: [
                                  Text("Progress: ",
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                              fontSize: 12, color: grey)),
                                  Text(
                                      "${(project.progress ?? 0).toStringAsFixed(2)}%",
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                              fontSize: 13, color: green)),
                                ],
                              ),
                              trailing: PopUpMenuWidget(
                                theme: theme,
                                onUpdateButtonPressed: () {
                                  openBottomSheet(
                                      context: context, project: project);
                                },
                              )),
                        ),
                      );
                    },
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.5, // Take full screen height
                  child: const Center(
                    child: Text('No projects found!'),
                  ),
                );
        } else {
          return Center(child: Text('Failed to load projects'));
        }
      },
    );
  }
}
