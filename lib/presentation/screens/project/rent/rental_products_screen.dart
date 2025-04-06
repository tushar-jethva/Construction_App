import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/logic/controllers/MenuBloc/menu_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/add_rental_product/add_rental_product_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/get_rental_project/get_rental_partie_project_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/rental_by_id/rental_by_partie_id_bloc.dart';
import 'package:construction_mate/logic/controllers/TabControlBloc/tab_control_bloc.dart';
import 'package:construction_mate/logic/models/get_rental_model.dart';
import 'package:construction_mate/presentation/router/go_router.dart';
import 'package:construction_mate/presentation/screens/project/rent/rental_bottom_sheet.dart';
import 'package:construction_mate/presentation/widgets/common/common_app_bar.dart';
import 'package:construction_mate/presentation/widgets/common/pop_up_menu_widget.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../logic/models/project_model.dart';
import '../../../../logic/models/rental/rental_model.dart';

class RentalProductsScreen extends StatefulWidget {
  final ProjectModel project;
  final Rentals rental;
  final String partieId;

  const RentalProductsScreen(
      {super.key,
      required this.project,
      required this.rental,
      required this.partieId});

  @override
  State<RentalProductsScreen> createState() => _RentalProductsScreenState();
}

class _RentalProductsScreenState extends State<RentalProductsScreen> {
  Future<void> onRefresh() async {
    context.read<AddRentalProductBloc>().add(
        AddRentalProductEvent.fetchAllRental(
            projectId: widget.project.sId ?? ""));
  }

  openBottomSheetOfMaterial(
      {required BuildContext context,
      required Details? material,
      bool? isUpdate}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => DateBlocBloc(),
            child: MyRentalAddBottomSheet(
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
        title: "Rental Products",
        onTap: () {
          context.pop();
        },
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        color: purple,
        child: BlocBuilder<GetRentalPartieProjectBloc,
            GetRentalPartieProjectState>(
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
                              Details(
                                  name: "Helloo",
                                  priceperunit: 0,
                                  quantity: 0,
                                  unit: "bags",
                                  description: "Description desctiptio ",
                                  date: DateTime.now().toString()));
                        }))
                : state.renalParties[state.partieIndex]
                            .rentals?[state.productIndex].details?.isNotEmpty ??
                        false
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.73,
                        child: ListView.builder(
                            itemCount: state
                                    .renalParties[state.partieIndex]
                                    .rentals?[state.productIndex]
                                    .details
                                    ?.length ??
                                0,
                            itemBuilder: (context, index) {
                              final rentalDetails = state
                                  .renalParties[state.partieIndex]
                                  .rentals?[state.productIndex]
                                  .details?[index];
                              return GestureDetector(
                                  onTap: () {},
                                  child: materialWidget(theme, rentalDetails));
                            }),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView(children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: const Center(
                                  child: Text("No Rental Products added"))),
                        ]),
                      );
          },
        ),
      ),
    );
  }

  Widget materialWidget(ThemeData theme, Details? rental) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rental?.name ?? '',
                    style: theme.textTheme.titleLarge?.copyWith(fontSize: 20),
                  ),
                  Text(
                    rental?.description ?? '',
                    style: theme.textTheme.titleMedium?.copyWith(
                        fontSize: 14, color: const Color(0xff6B7580)),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Quantity: ",
                            style: theme.textTheme.titleMedium?.copyWith(
                                fontSize: 14, color: theme.canvasColor),
                          ),
                          Text(
                            (rental?.quantity ?? 0).toString(),
                            style: theme.textTheme.titleLarge?.copyWith(
                                fontSize: 16, color: theme.canvasColor),
                          ),
                        ],
                      ),
                      10.wx,
                      Text(
                        ReusableFunctions.getFormattedDate(rental?.date ?? ''),
                        style: theme.textTheme.bodyMedium
                            ?.copyWith(color: gray500),
                      ),
                    ],
                  ),
                  PopUpMenuWidget(
                    theme: theme,
                    onUpdateButtonPressed: () {
                      openBottomSheetOfMaterial(
                          context: context, material: rental, isUpdate: true);
                    },
                    onDeleteButtonPressed: () {},
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
