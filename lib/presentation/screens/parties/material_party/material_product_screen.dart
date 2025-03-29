import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/logic/controllers/Material/material_by_partie/material_by_partie_bloc.dart';
import 'package:construction_mate/logic/controllers/Material/material_project_partie/material_partie_project_bloc.dart';
import 'package:construction_mate/logic/controllers/MenuBloc/menu_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/add_rental_product/add_rental_product_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/rental_by_id/rental_by_partie_id_bloc.dart';
import 'package:construction_mate/logic/controllers/TabControlBloc/tab_control_bloc.dart';
import 'package:construction_mate/logic/models/get_material_model.dart';
import 'package:construction_mate/logic/models/get_rental_model.dart';
import 'package:construction_mate/logic/models/material/all_material_model.dart';
import 'package:construction_mate/presentation/router/go_router.dart';
import 'package:construction_mate/presentation/screens/project/rent/rental_bottom_sheet.dart';
import 'package:construction_mate/presentation/widgets/common/common_app_bar.dart';
import 'package:construction_mate/presentation/widgets/common/pop_up_menu_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/add_material_bottom_sheet.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../logic/models/project_model.dart';

class MaterialProductsScreen extends StatefulWidget {
  final ProjectModel project;
  final Rentals materials;
  final String partieId;

  const MaterialProductsScreen(
      {super.key,
      required this.project,
      required this.partieId,
      required this.materials});

  @override
  State<MaterialProductsScreen> createState() => _MaterialProductsScreenState();
}

class _MaterialProductsScreenState extends State<MaterialProductsScreen> {
  Future<void> onRefresh() async {
    // context.read<MaterialByPartieBloc>().add(
    //     MaterialByPartieEvent.getMaterialByPartie(
    //         partieId: widget.partieId ?? ""));
  }

  openBottomSheetOfMaterial(
      {required BuildContext context,
      required Details material,
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
              partieId: widget.partieId,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Material Products",
        onTap: () {
          context.pop();
        },
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        color: purple,
        child:
            BlocBuilder<MaterialPartieProjectBloc, MaterialPartieProjectState>(
          builder: (context, state) {
            return state.state.isLoading
                ? Skeletonizer(
                    enabled: true,
                    child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return materialWidget(theme, Details());
                        }))
                : state.listOfMaterialParty[state.partieIndex]
                            .rentals?[state.productIndex].details?.isNotEmpty ??
                        false
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.73,
                        child: ListView.builder(
                            itemCount: state
                                    .listOfMaterialParty[state.partieIndex]
                                    .rentals?[state.productIndex]
                                    .details
                                    ?.length ??
                                0,
                            itemBuilder: (context, index) {
                              final material = state
                                  .listOfMaterialParty[state.partieIndex]
                                  .rentals?[state.productIndex]
                                  .details?[index];
                              return GestureDetector(
                                  onTap: () {},
                                  child: materialWidget(
                                      theme, material ?? Details()));
                            }),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView(children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: const Center(
                                  child: Text("No Material Products added"))),
                        ]),
                      );
          },
        ),
      ),
    );
  }

  Widget materialWidget(ThemeData theme, Details material) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: PopUpMenuWidget(
              theme: theme,
              onUpdateButtonPressed: () {
                openBottomSheetOfMaterial(
                    context: context, material: material, isUpdate: true);
              },
              onDeleteButtonPressed: () {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    material.name ?? '',
                    style: theme.textTheme.titleLarge?.copyWith(fontSize: 20),
                  ),
                  Text(
                    material.description ?? '',
                    style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 14, color: const Color(0xff6B7580)),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Quantity: ",
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontSize: 14, color: theme.canvasColor),
                      ),
                      Text(
                        (material.quantity ?? 0).toString(),
                        style: theme.textTheme.titleLarge
                            ?.copyWith(fontSize: 16, color: theme.canvasColor),
                      ),
                    ],
                  ),
                  10.wx,
                  Text(
                    ReusableFunctions.getFormattedDate(
                        material.date ?? DateTime.now().toString()),
                    style: theme.textTheme.bodyMedium?.copyWith(color: gray500),
                  ),
                ],
              ),
            ],
          ),
          const Divider()
        ],
      ),
    );
  }
}
