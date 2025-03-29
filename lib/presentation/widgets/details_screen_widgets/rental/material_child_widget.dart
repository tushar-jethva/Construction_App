import 'package:construction_mate/logic/controllers/Building-by-id/building_by_id_bloc.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/logic/models/get_material_model.dart';
import 'package:construction_mate/logic/models/get_rental_model.dart';
import 'package:construction_mate/logic/models/material/material_model.dart';
import 'package:construction_mate/logic/models/rental/rental_model.dart';
import 'package:construction_mate/presentation/screens/project/project_screen.dart';
import 'package:construction_mate/presentation/screens/project/rent/rental_bottom_sheet.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/add_material_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RentalChildWidget extends StatelessWidget {
  const RentalChildWidget({super.key});

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
            child: BlocBuilder<BuildingByIdBloc, BuildingByIdState>(
              builder: (context, state) {
                return MyRentalAddBottomSheet(
                  projectId: state.project?.sId ?? "",
                  material: material,
                  isUpdate: isUpdate,
                  partieId: '',
                );
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: CommonButton2(
          buttonName: 'Rental',
          onTap: () {
            context.read<DateBlocBloc>().add(const DateBlocEvent.initalize());
            openBottomSheetOfMaterial(
                context: context,
                isUpdate: false,
                material: Details(
                    rentalId: '',
                    name: "",
                    priceperunit: 0,
                    quantity: 0,
                    unit: "",
                    description: "",
                    date: ""));
          }),
    );
  }
}
