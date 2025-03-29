import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/Material/material_project_partie/material_partie_project_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/get_rental_project/get_rental_partie_project_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_app_bar.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../logic/models/project_model.dart';
import '../../../../logic/models/rental/rental_model.dart';
import '../../../widgets/common/common_icon_circle_widget.dart';

class RentThingScreen extends StatefulWidget {
  final ProjectModel project;
  final Data rental;
  final String partieId;

  const RentThingScreen(
      {super.key,
      required this.project,
      required this.partieId,
      required this.rental});

  @override
  State<RentThingScreen> createState() => _RentThingScreenState();
}

class _RentThingScreenState extends State<RentThingScreen> {
  Future<void> onRefresh() async {
    // context.read<MaterialByPartieBloc>().add(
    //     MaterialByPartieEvent.getMaterialByPartie(
    //         partieId: widget.partieId ?? ""));
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
                          return agenyOneWidget(
                              theme, Rentals(name: "Rental"), index);
                        }))
                : state.renalParties[state.partieIndex].rentals?.isNotEmpty ??
                        false
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.73,
                        child: ListView.builder(
                            itemCount: widget.rental.rentals?.length ?? 0,
                            itemBuilder: (context, index) {
                              final rental = state
                                  .renalParties[state.partieIndex]
                                  .rentals?[index];
                              return GestureDetector(
                                  onTap: () {
                                    context
                                        .read<GetRentalPartieProjectBloc>()
                                        .add(GetRentalPartieProjectEvent
                                            .onProductIndexChanged(
                                                index: index));
                                    context.pushNamed(
                                      RoutesName
                                          .RENT_PRODUCTS_BY_PROJECT_SCREEN_NAME,
                                      extra: {
                                        'project': widget.project,
                                        'partieId': widget.partieId,
                                        'rental': rental
                                      },
                                    );
                                  },
                                  child: agenyOneWidget(
                                      theme, rental ?? Rentals(), index));
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

  Padding agenyOneWidget(ThemeData theme, Rentals agency, int index) {
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
                                "Total Quantity:",
                                style: theme.textTheme.titleMedium
                                    ?.copyWith(color: grey, fontSize: 12),
                              ),
                              Text(
                                "₹ ${agency.totalQuantity ?? 0}",
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
                                "Total Price:",
                                style: theme.textTheme.titleMedium
                                    ?.copyWith(color: grey, fontSize: 12),
                              ),
                              Text(
                                "₹ ${agency.totalPrice}",
                                style: theme.textTheme.titleLarge
                                    ?.copyWith(color: green, fontSize: 13),
                              )
                            ],
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Total Payable: ",
                          //       style: theme.textTheme.titleMedium
                          //           ?.copyWith(color: grey, fontSize: 12),
                          //     ),
                          //     Text(
                          //       "₹ ${0}",
                          //       style: theme.textTheme.titleLarge
                          //           ?.copyWith(color: red, fontSize: 13),
                          //     ),
                          //   ],
                          // )
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
