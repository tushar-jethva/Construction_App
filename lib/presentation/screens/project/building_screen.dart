// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/logic/controllers/FloorNameAndFeet/floor_name_and_feet_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/data/datasource/transaction_data_source.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/controllers/BuildingAddBloc/buildings_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentInDropDownBloc/payment_in_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentOutDropDownBloc/payment_out_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentTotalProjectWiseBloc/payment_total_project_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/logic/models/building_model.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/presentation/widgets/common/custom_button_with_widget.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/drop_down.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/building_add_bottom_sheet_widget.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/building_card.dart';
import 'package:construction_mate/presentation/widgets/details_screen_widgets/building_screen_list_shimmer.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_bottom_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BuildingsScreen extends StatefulWidget {
  final ProjectModel project;
  final PaymentTotalProjectBloc bloc;
  const BuildingsScreen({
    Key? key,
    required this.project,
    required this.bloc,
  }) : super(key: key);

  @override
  State<BuildingsScreen> createState() => _BuildingsScreenState();
}

class _BuildingsScreenState extends State<BuildingsScreen> {
  final TextEditingController _priceInController = TextEditingController();
  final TextEditingController _priceOutController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();
  final formPaymentOutKey = GlobalKey<FormState>();
  final formPaymentInKey = GlobalKey<FormState>();

  final TransactionRepository transactionRepository = TransactionRepositoryImpl(
      transactionDataSource: TransactionDataSourceImpl());

  openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => FloorNameAndFeetBloc(),
            child: MyBuildingAddBottomSheetWidget(
              project: widget.project,
            ),
          );
        });
  }

  late BuildingsBloc _buildingsBloc;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _buildingsBloc = BlocProvider.of<BuildingsBloc>(context);
    _buildingsBloc.add(LoadBuildings(projectId: widget.project.sId!));
  }

  Future<void> _refreshBuildings() async {
    _buildingsBloc.add(LoadBuildings(projectId: widget.project.sId!));
  }

  void _showPaymentInDialog({required ThemeData theme}) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: mediaQueryData.viewInsets,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r))),
                child: Form(
                  key: formPaymentInKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.0.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Payment In",
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                        Gap(20.h),
                        BlocBuilder<PaymentInDropDownBloc,
                            PaymentInDropDownState>(
                          builder: (context, state) {
                            if (state is AgenciesLoadedInState) {
                              return PaymentOutCustomDropDown(
                                value: state.agencies[0].sId,
                                list: state.agencies
                                    .map((e) => DropdownMenuItem(
                                          value: e.sId,
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4, // Set a specific width here
                                            child: Text(
                                              e.name!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (val) {
                                  val != state.agencies[0].sId
                                      ? context
                                          .read<PaymentInDropDownBloc>()
                                          .add(AgencyValueInChanged(
                                              agencyId: val!))
                                      : {};
                                },
                                // ignore: body_might_complete_normally_nullable
                                validator: (val) {
                                  if (val == state.agencies[0].sId) {
                                    return 'Please select one of the names!';
                                  }
                                },
                              );
                            }
                            return CustomDropDown(items: nameOfAgency);
                          },
                        ),
                        Gap(20.h),
                        MyCustomTextFormField(
                          controller: _priceInController,
                          hintText: "Payment In",
                          maxLines: 1,
                          textInputType: TextInputType.number,
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter price per feet!';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter valid digit!';
                            }
                            if (value.startsWith('-')) {
                              return 'Please enter valid digit!';
                            }
                          },
                        ),
                        Gap(15.h),
                        MyCustomTextFormField(
                          controller: _descriptionController,
                          hintText: "Description",
                          maxLines: 3,
                          textInputType: TextInputType.name,
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter description!';
                            }
                          },
                        ),
                        Gap(30.h),
                        BlocListener<PaymentInDropDownBloc,
                            PaymentInDropDownState>(
                          listener: (context, state) {
                            if (state is PaymentInAddSuccess) {
                              ReusableFunctions.showSnackBar(
                                  context: context,
                                  content: 'Transaction In add successfully!');
                              widget.bloc.add(FetchTotalPaymentOutProject(
                                  projectId: widget.project.sId!));
                              context
                                  .read<TotalPaymentOutBloc>()
                                  .add(FetchTotalPaymentOut());
                              Navigator.pop(context);
                            }
                          },
                          child: BlocBuilder<PaymentInDropDownBloc,
                              PaymentInDropDownState>(
                            builder: (context, state) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: CustomElevatedButton(
                                  isLoading: state is PaymentInAddLoading,
                                  label: 'Payment In',
                                  onTap: () async {
                                    if (formPaymentInKey.currentState!
                                        .validate()) {
                                      context
                                          .read<PaymentInDropDownBloc>()
                                          .add(AddPaymentInTransaction(
                                            amount: _priceInController.text,
                                          ));

                                      _descriptionController.clear();
                                      _priceInController.clear();
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  void _showPaymentOutDialog({required ThemeData theme}) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return Padding(
            padding: mediaQueryData.viewInsets,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                decoration: BoxDecoration(
                    color: theme.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r))),
                child: Form(
                  key: formPaymentOutKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.0.w, vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Payment Out",
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                        Gap(20.h),
                        Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: grey, width: 1)),
                            child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  border: InputBorder.none,
                                  hintStyle: theme.textTheme.titleMedium,
                                  hintText: "${widget.project.name}"),
                            )),
                        Gap(15.h),
                        BlocBuilder<PaymentOutDropDownBloc,
                            PaymentOutDropDownState>(
                          builder: (context, state) {
                            if (state is BuildingsLoadingState) {
                              return CustomDropDown(items: selectBuilding);
                            } else if (state is BuildingsLoadedState ||
                                state is AgenciesLoadedState) {
                              return PaymentOutCustomDropDown(
                                value: state.buildingValue,
                                list: state.buildings
                                    .map((e) => DropdownMenuItem(
                                          value: e.sId,
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4, // Set a specific width here
                                            child: Text(
                                              e.name!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (val) {
                                  val != state.buildings[0].sId
                                      ? context
                                          .read<PaymentOutDropDownBloc>()
                                          .add(FetchAgenciesEvent2(
                                              val!, state.projectValue))
                                      : {};
                                },
                                // ignore: body_might_complete_normally_nullable
                                validator: (val) {
                                  if (val == state.buildings[0].sId) {
                                    return 'Please select one of the names!';
                                  }
                                },
                              );
                            }
                            return CustomDropDown(items: selectBuilding);
                          },
                        ),
                        Gap(15.h),
                        BlocBuilder<PaymentOutDropDownBloc,
                            PaymentOutDropDownState>(
                          builder: (context, state) {
                            if (state is AgenciesLoadedState) {
                              return PaymentOutCustomDropDown(
                                value: state.agencies[0].agencyId,
                                list: state.agencies
                                    .map((e) => DropdownMenuItem(
                                          value: e.agencyId,
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4, // Set a specific width here
                                            child: Text(
                                              e.agencyName!,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (val) {
                                  val != state.agencies[0].agencyId
                                      ? context
                                          .read<PaymentOutDropDownBloc>()
                                          .add(AgencyValueChanged(
                                              agencyId: val!))
                                      : {};
                                },
                                // ignore: body_might_complete_normally_nullable
                                validator: (val) {
                                  if (val == state.agencies[0].agencyId) {
                                    return 'Please select one of the names!';
                                  }
                                },
                              );
                            }
                            return CustomDropDown(items: nameOfAgency);
                          },
                        ),
                        Gap(20.h),
                        MyCustomTextFormField(
                          controller: _priceOutController,
                          hintText: "Payment OUT",
                          maxLines: 1,
                          textInputType: TextInputType.number,
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter price per feet!';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter valid digit!';
                            }
                            if (value.startsWith('-')) {
                              return 'Please enter valid digit!';
                            }
                          },
                        ),
                        Gap(15.h),
                        MyCustomTextFormField(
                          controller: _descriptionController,
                          hintText: "Description",
                          maxLines: 3,
                          textInputType: TextInputType.name,
                          // ignore: body_might_complete_normally_nullable
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter description!';
                            }
                          },
                        ),
                        Gap(30.h),
                        BlocListener<PaymentOutDropDownBloc,
                            PaymentOutDropDownState>(
                          listener: (context, state) {
                            if (state is PaymentOutAddSuccess) {
                              widget.bloc.add(FetchTotalPaymentOutProject(
                                  projectId: widget.project.sId!));
                              context
                                  .read<TotalPaymentOutBloc>()
                                  .add(FetchTotalPaymentOut());
                              ReusableFunctions.showSnackBar(
                                  context: context,
                                  content: "Transaction Out add successfully!");
                              Navigator.pop(context);
                            }
                          },
                          child: BlocBuilder<PaymentOutDropDownBloc,
                              PaymentOutDropDownState>(
                            builder: (context, state) {
                              return CustomElevatedButton(
                                  isLoading: state is PaymentOutAddLoading,
                                  label: "Payment Out",
                                  onTap: () async {
                                    if (formPaymentOutKey.currentState!
                                        .validate()) {
                                      context
                                          .read<PaymentOutDropDownBloc>()
                                          .add(AddPaymentOutTransaction(
                                              amount: _priceOutController.text,
                                              description:
                                                  _descriptionController.text));
                                    }
                                  });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshBuildings,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Buildings",
                    style: theme.textTheme.titleMedium!.copyWith(fontSize: 16),
                  ),
                  MyCustomButton(
                      buttonName: '+ Add Building',
                      color: transparent,
                      style: TextStyle(
                          fontSize: 16,
                          color: purple,
                          fontWeight: FontWeight.bold),
                      onPressed: () {
                        openBottomSheet(context: context);
                      }),
                ],
              ),
            ),
            BlocBuilder<BuildingsBloc, BuildingsState>(
                builder: (context, state) {
              if (state is BuildingsInitial || state is BuildingAddLoading) {
                return Expanded(
                  child: Skeletonizer(
                    enabled: true,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return MyBuildingListWidget(
                              building: BuildingModel(
                            name: "Name",
                            totalFloor: 10,
                          ));
                        }),
                  ),
                );
              } else if (state is BuildingsLoadSuccess) {
                return state.buildings.isEmpty
                    ? Expanded(
                        child: ListView(children: [
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.6,
                              child:
                                  Center(child: Text("No building founds!"))),
                        ]),
                      )
                    : Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: state.buildings.length,
                            itemBuilder: (context, index) {
                              BuildingModel building = state.buildings[index];
                              return GestureDetector(
                                  onTap: () {
                                    context.pushNamed(
                                        RoutesName.buildingDetailsScreen,
                                        extra: {
                                          "buildingModel": building,
                                          "projectModel": widget.project
                                        });
                                  },
                                  child:
                                      MyBuildingListWidget(building: building));
                            }),
                      );
              } else {
                return const Center(child: Text('Failed to load projects'));
              }
            }),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                    left: 10.w, right: 10.w, bottom: 10.h, top: 10.h),
                height: 50.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        label: "Payment In",
                        backgroundColor: green,
                        borderColor: transparent,
                        onTap: () {
                          context
                              .read<PaymentInDropDownBloc>()
                              .add(FetchAgencyInEvent());
                          _showPaymentInDialog(theme: theme);
                        },
                      ),
                    ),
                    30.wx,
                    Expanded(
                      child: CustomElevatedButton(
                        label: "Payment Out",
                        backgroundColor: red,
                        borderColor: transparent,
                        onTap: () {
                          context
                              .read<PaymentOutDropDownBloc>()
                              .add(FetchBuildingsEvent(widget.project.sId!));
                          _showPaymentOutDialog(theme: theme);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
