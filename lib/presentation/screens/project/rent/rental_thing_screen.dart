import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/Rent/get_rental_project/get_rental_partie_project_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_app_bar.dart';
import 'package:construction_mate/presentation/widgets/common/draggable_scrollable_sheet.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  //On Refresh
  Future<void> onRefresh() async {
    // context.read<MaterialByPartieBloc>().add(
    //     MaterialByPartieEvent.getMaterialByPartie(
    //         partieId: widget.partieId ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.cardColor,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: "Rental Products",
          onTap: () {
            context.pop();
          },
        ),
        body: Stack(
          children: [
            searchSection(theme),
            scrollableSheetWidget(context, theme)
          ],
        ));
  }

  Widget searchSection(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, left: 10.w, bottom: 10.h),
      child: TextField(
        maxLines: 1,
        onChanged: (value) {
          context.read<GetRentalPartieProjectBloc>().add(
              GetRentalPartieProjectEvent.onSearchQueryChanged(
                  searchQuery: value.toLowerCase()));
        },
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        style: theme.textTheme.titleMedium,
        decoration: InputDecoration(
          filled: true,
          fillColor: theme.scaffoldBackgroundColor,
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: grey,
          ),
          hintText: 'Search transactions',
          hintStyle: theme.textTheme.titleMedium!.copyWith(color: grey),
          contentPadding: EdgeInsets.symmetric(vertical: 5.h),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: grey, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: transparent, width: 1)),
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
                  isSvg: false,
                  backgroundColor: theme.cardColor,
                  imagewidget:
                      Image.asset(rentalIcons[index % rentalIcons.length]),
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
                                "Total Hours:",
                                style: theme.textTheme.titleMedium
                                    ?.copyWith(color: grey, fontSize: 12),
                              ),
                              Text(
                                " ${agency.totalHours ?? 0}",
                                style: theme.textTheme.titleLarge?.copyWith(
                                    color: Colors.black, fontSize: 13),
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
                          Row(
                            children: [
                              Text(
                                "Total Days: ",
                                style: theme.textTheme.titleMedium
                                    ?.copyWith(color: grey, fontSize: 12),
                              ),
                              Text(
                                " ${agency.totalDays ?? 0}",
                                style: theme.textTheme.titleLarge
                                    ?.copyWith(color: black, fontSize: 13),
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

  DraggableScrollableSheetCommonComp scrollableSheetWidget(
      BuildContext context, ThemeData theme) {
    return DraggableScrollableSheetCommonComp(
      draggableScrollableController: DraggableScrollableController(),
      stops: const [0.9, 0.98],
      initialSize: 0.9,
      minChildSize: 0.9,
      radius: 20,
      isDraggerShow: false,
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            RefreshIndicator(
              onRefresh: onRefresh,
              color: purple,
              child: BlocBuilder<GetRentalPartieProjectBloc,
                  GetRentalPartieProjectState>(
                builder: (context, state) {
                  final listOfMaterialThing =
                      (state.renalParties[state.partieIndex].rentals ?? [])
                          .where(
                            (r) => (r.name ?? '')
                                .replaceAll(' ', '')
                                .toLowerCase()
                                .contains(state.searchQuery),
                          )
                          .toList();

                  // context.read<MaterialPartieProjectBloc>().add(MaterialPartieProjectEvent.onMaterialSearchListChange(listOfMaterialSearch: listOfMaterialThing));

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
                      : listOfMaterialThing.isNotEmpty
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.73,
                              child: ListView.builder(
                                  itemCount: listOfMaterialThing.length ?? 0,
                                  itemBuilder: (context, index) {
                                    final rental = listOfMaterialThing[index];
                                    return GestureDetector(
                                        onTap: () {
                                          context
                                              .read<
                                                  GetRentalPartieProjectBloc>()
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
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: const Center(
                                        child:
                                            Text("No Rental Products added"))),
                              ]),
                            );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
