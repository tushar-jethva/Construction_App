import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/AddMaterialBloc/add_material_bloc.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/logic/models/material_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/widgets/common/pop_up_menu_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/add_material_bottom_sheet.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
      required MaterialModel material,
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
      child: BlocBuilder<AddMaterialBloc, AddMaterialState>(
        builder: (context, state) {
          return state.state.isLoading
              ? Skeletonizer(
                  enabled: true,
                  child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return materialWidget(
                            theme,
                            MaterialModel(
                                materialName: "Helloo",
                                quantity: "10",
                                unit: "bags",
                                description: "Description desctiptio ",
                                date: DateTime.now().toString()));
                      }))
              : state.materialList.isNotEmpty
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.73,
                      child: ListView.builder(
                          itemCount: state.materialList.length,
                          controller: widget.scrollController,
                          itemBuilder: (context, index) {
                            final material = state.materialList[index];
                            return materialWidget(theme, material);
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

  Widget materialWidget(ThemeData theme, MaterialModel material) {
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
                    material.materialName,
                    style: theme.textTheme.titleLarge?.copyWith(fontSize: 20),
                  ),
                  Text(
                    material.description,
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
                        material.quantity,
                        style: theme.textTheme.titleLarge
                            ?.copyWith(fontSize: 16, color: theme.canvasColor),
                      ),
                    ],
                  ),
                  10.wx,
                  Text(
                    ReusableFunctions.getFormattedDate(material.date),
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
