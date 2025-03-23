import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/AddMaterialBloc/add_material_bloc.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/logic/controllers/Material/material_by_partie/material_by_partie_bloc.dart';
import 'package:construction_mate/logic/controllers/Material/material_project_partie/material_partie_project_bloc.dart';
import 'package:construction_mate/logic/models/get_material_model.dart';
import 'package:construction_mate/logic/models/material_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/logic/models/project_partie_model.dart';
import 'package:construction_mate/presentation/router/go_router.dart';
import 'package:construction_mate/presentation/widgets/common/pop_up_menu_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/add_material_bottom_sheet.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../widgets/common/common_icon_circle_widget.dart';

class MaterialScreen extends StatefulWidget {
  final ProjectModel project;
  final ScrollController scrollController;
  const MaterialScreen(
      {super.key, required this.project, required this.scrollController});

  @override
  State<MaterialScreen> createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
  //Init
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // context.read<AddMaterialBloc>().add(
    //     AddMaterialEvent.fetchAllMaterial(projectId: widget.project.sId ?? ""));
  }

  openBottomSheetOfMaterial(
      {required BuildContext context,
      required GetMaterialModel material,
      bool? isUpdate}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => DateBlocBloc(),
            child: MyMaterialAddBottomSheet(
              projectId: widget.project.sId ?? "",
              material: material,
              isUpdate: isUpdate,
            ),
          );
        });
  }

  Future<void> onRefresh() async {
    context.read<AddMaterialBloc>().add(
        AddMaterialEvent.fetchAllMaterial(projectId: widget.project.sId ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: purple,
      child: BlocBuilder<MaterialPartieProjectBloc, MaterialPartieProjectState>(
        builder: (context, state) {
          return state.state.isLoading
              ? Skeletonizer(
                  enabled: true,
                  child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return agenyOneWidget(
                            theme,
                            ProjectPartieModel(
                              name: "Helloo",
                            ),
                            0);
                      }))
              : state.listOfMaterialPartie.isNotEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.73,
                      child: ListView.builder(
                          itemCount: state.listOfMaterialPartie.length,
                          controller: widget.scrollController,
                          itemBuilder: (context, index) {
                            final materialPartie =
                                state.listOfMaterialPartie[index];
                            return GestureDetector(
                                onTap: () {
                                  context.read<MaterialByPartieBloc>().add(
                                      MaterialByPartieEvent.getMaterialByPartie(
                                          partieId: materialPartie.sId ?? ''));
                                  context.pushNamed(
                                      RoutesName
                                          .MATERIAL_PRODUCTS_BY_PROJECT_SCREEN_NAME,
                                      extra: {
                                        'project': widget.project,
                                        'partieId': materialPartie.sId
                                      });
                                },
                                child: agenyOneWidget(
                                    theme, materialPartie, index));
                          }),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView(children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: const Center(
                                child: Text("No material added!"))),
                      ]),
                    );
        },
      ),
    );
  }

  Padding agenyOneWidget(
      ThemeData theme, ProjectPartieModel agency, int index) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15, bottom: 10, top: 10),
      child: Container(
        color: transparent,
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                IconCircleWidget(
                  radius: 10,
                  isSvg: true,
                  svgpath: userIcons[index % userIcons.length],
                  backgroundColor: theme.cardColor,
                ),
                10.wx,
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            agency.name ?? "",
                            style: theme.textTheme.titleLarge
                                ?.copyWith(fontSize: 14),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(Assets.svg.remaining.path),
                              5.wx,
                              Text(
                                "Remaining: ",
                                style: theme.textTheme.titleMedium
                                    ?.copyWith(color: grey, fontSize: 12),
                              ),
                              Text(
                                "₹ ${agency.totalCost ?? 0}",
                                style: theme.textTheme.titleLarge?.copyWith(
                                    color: Colors.orange, fontSize: 13),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Total Paid:",
                                style: theme.textTheme.titleMedium
                                    ?.copyWith(color: grey, fontSize: 12),
                              ),
                              Text(
                                " ₹ ${0}",
                                style: theme.textTheme.titleLarge
                                    ?.copyWith(color: green, fontSize: 13),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Total Payable: ",
                                style: theme.textTheme.titleMedium
                                    ?.copyWith(color: grey, fontSize: 12),
                              ),
                              Text(
                                "₹ ${0}",
                                style: theme.textTheme.titleLarge
                                    ?.copyWith(color: red, fontSize: 13),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
