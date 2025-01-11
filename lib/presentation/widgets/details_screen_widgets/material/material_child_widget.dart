import 'package:construction_mate/logic/controllers/Building-by-id/building_by_id_bloc.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/logic/models/material_model.dart';
import 'package:construction_mate/presentation/screens/bottom_bar.dart';
import 'package:construction_mate/presentation/screens/project/project_screen.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/add_material_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialChildWidget extends StatelessWidget {
  const MaterialChildWidget({super.key});

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
            child: BlocBuilder<BuildingByIdBloc, BuildingByIdState>(
              builder: (context, state) {
                return MyMaterialAddBottomSheet(
                  projectId: state.project?.sId ?? "",
                  material: material,
                  isUpdate: isUpdate,
                );
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: CommonButton2(
          buttonName: 'Material',
          onTap: () {
            context.read<DateBlocBloc>().add(const DateBlocEvent.initalize());
            openBottomSheetOfMaterial(
                context: context,
                isUpdate: false,
                material: MaterialModel(
                    materialName: "",
                    quantity: "",
                    unit: "",
                    description: "",
                    date: ""));
          }),
    );
  }
}
