// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/AddBillingPartyBloc/add_billing_party_bloc.dart';
import 'package:construction_mate/logic/controllers/Gst/gst_bloc.dart';
import 'package:construction_mate/logic/controllers/Material/material_agencies/material_agencies_bloc.dart';
import 'package:construction_mate/logic/controllers/OtherExpense/payment_out_other_expense_bloc.dart';
import 'package:construction_mate/logic/controllers/OtherExpenseBloc/other_expense_bloc.dart';
import 'package:construction_mate/logic/controllers/Parties/add_parties/add_parties_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentInDropDownBloc/payment_in_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentOutOtherMaterailAndRentBloc/payment_out_other_material_and_rent_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/get_rental_suppliers/get_rental_suppliers_bloc.dart';
import 'package:construction_mate/logic/controllers/SwitchBloc/switch_bloc.dart';
import 'package:construction_mate/logic/controllers/Tds/tds_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:construction_mate/utilities/extension/transaction_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/data/datasource/transaction_data_source.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/controllers/PaymentOutDropDownBloc/payment_out_drop_down_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/drop_down.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TransactionBottomWidget extends StatefulWidget {
  const TransactionBottomWidget({
    super.key,
  });

  @override
  State<TransactionBottomWidget> createState() =>
      _TransactionBottomWidgetState();
}

class _TransactionBottomWidgetState extends State<TransactionBottomWidget> {
  void _showPaymentInDialog({required ThemeData theme}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          return const PaymentInWidget();
        });
  }

  void _showPaymentOutDialog({required ThemeData theme}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          // context
          //     .read<PaymentOutDropDownBloc>()
          //     .add(AgencyTypeChangeEvent(partyType: PartyType.none));
          return const PaymentOutWidget();
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomElevatedButton(
                label: "You Got",
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
                label: "You Gave",
                backgroundColor: red,
                borderColor: transparent,
                onTap: () {
                  context
                      .read<PaymentOutDropDownBloc>()
                      .add(FetchProjectsEvent());

                  _showPaymentOutDialog(theme: theme);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOutWidget extends StatefulWidget {
  const PaymentOutWidget({
    super.key,
  });

  @override
  State<PaymentOutWidget> createState() => _PaymentOutWidgetState();
}

class _PaymentOutWidgetState extends State<PaymentOutWidget> {
  final TextEditingController _priceOutController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();
  final formPaymentOutKey = GlobalKey<FormState>();

  final TransactionRepository transactionRepository = TransactionRepositoryImpl(
      transactionDataSource: TransactionDataSourceImpl());
  @override
  void dispose() {
    super.dispose();
    _priceOutController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return BlocProvider(
      create: (context) => SwitchBloc(),
      child: Padding(
        padding: mediaQueryData.viewInsets,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r))),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Payment Out",
                    style: theme.textTheme.titleLarge,
                  ),
                ),
                Gap(10.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: BlocBuilder<SwitchBloc, SwitchState>(
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Other expenses: ",
                              style: theme.textTheme.titleLarge!
                                  .copyWith(fontSize: 15),
                            ),
                            Switch(
                              value: state.isSwitched,
                              activeColor: white,
                              activeTrackColor: green,
                              inactiveTrackColor: white,
                              inactiveThumbColor: black,
                              onChanged: (val) {
                                context
                                    .read<SwitchBloc>()
                                    .add(SwitchEvent.switched());
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                BlocBuilder<SwitchBloc, SwitchState>(
                  builder: (context, state) {
                    return !state.isSwitched
                        ? Form(
                            key: formPaymentOutKey,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0.w, vertical: 10.h),
                              child: BlocBuilder<PaymentOutDropDownBloc,
                                  PaymentOutDropDownState>(
                                builder: (context, state) {
                                  return Column(
                                    children: [
                                      CustomDropDown(
                                        items: const [
                                          "Labour",
                                          "Material supplier",
                                          "Equipment supplier"
                                        ],
                                        onChanged: (val) {
                                          final selectedPartyType =
                                              PartyType.values.firstWhere(
                                            (e) {
                                              return e.apiValue == val;
                                            },
                                            orElse: () => PartyType
                                                .none, // default value if not found
                                          );

                                          context
                                              .read<PaymentOutDropDownBloc>()
                                              .add(
                                                AgencyTypeChangeEvent(
                                                    partyType:
                                                        selectedPartyType),
                                              );
                                        },
                                      ),
                                      15.hx,
                                      BlocBuilder<PaymentOutDropDownBloc,
                                              PaymentOutDropDownState>(
                                          builder: (context, state) {
                                        if (state is ProjectsLoadingState) {
                                          return CustomDropDown(
                                              items: selectProject);
                                        }
                                        return Column(
                                          children: [
                                            PaymentOutCustomDropDown(
                                              value: state.projects[0].sId,
                                              list: state.projects
                                                  .map((e) => DropdownMenuItem(
                                                        value: e.sId,
                                                        child: SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4, // Set a specific width here
                                                          child: Text(
                                                            e.name!,
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                      ))
                                                  .toList(),
                                              onChanged: (val) {
                                                val != state.projects[0].sId
                                                    ? context
                                                        .read<
                                                            PaymentOutDropDownBloc>()
                                                        .add(
                                                            FetchBuildingsEvent(
                                                                val!))
                                                    : ();
                                              },
                                              // ignore: body_might_complete_normally_nullable
                                              validator: (val) {
                                                if (val ==
                                                    state.projects[0].sId) {
                                                  return 'Please select project';
                                                }
                                              },
                                            ),
                                          ],
                                        );
                                      }),
                                      state.partyType == PartyType.SubContractor
                                          ? Column(
                                              children: [
                                                Gap(15.h),
                                                BlocBuilder<
                                                    PaymentOutDropDownBloc,
                                                    PaymentOutDropDownState>(
                                                  builder: (context, state) {
                                                    if (state
                                                        is BuildingsLoadingState) {
                                                      return CustomDropDown(
                                                          items:
                                                              selectBuilding);
                                                    } else if (state
                                                            is BuildingsLoadedState ||
                                                        state
                                                            is AgenciesLoadedState) {
                                                      return PaymentOutCustomDropDown(
                                                        value:
                                                            state.buildingValue,
                                                        list: state.buildings
                                                            .map((e) =>
                                                                DropdownMenuItem(
                                                                  value: e.sId,
                                                                  child:
                                                                      SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.4, // Set a specific width here
                                                                    child: Text(
                                                                      e.name!,
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    ),
                                                                  ),
                                                                ))
                                                            .toList(),
                                                        onChanged: (val) {
                                                          val !=
                                                                  state
                                                                      .buildings[
                                                                          0]
                                                                      .sId
                                                              ? context
                                                                  .read<
                                                                      PaymentOutDropDownBloc>()
                                                                  .add(FetchAgenciesEvent2(
                                                                      val!,
                                                                      state
                                                                          .projectValue))
                                                              : {};
                                                        },
                                                        // ignore: body_might_complete_normally_nullable
                                                        validator: (val) {
                                                          if (val ==
                                                              state.buildings[0]
                                                                  .sId) {
                                                            return 'Please select building!';
                                                          }
                                                        },
                                                      );
                                                    }
                                                    return CustomDropDown(
                                                        items: selectBuilding);
                                                  },
                                                ),
                                              ],
                                            )
                                          : const SizedBox.shrink(),
                                      Gap(15.h),
                                      state.partyType == PartyType.SubContractor
                                          ? BlocBuilder<PaymentOutDropDownBloc,
                                              PaymentOutDropDownState>(
                                              builder: (context, state) {
                                                if (state
                                                    is AgenciesLoadedState) {
                                                  return PaymentOutCustomDropDown(
                                                    value: state
                                                        .agencies[0].agencyId,
                                                    list: state.agencies
                                                        .map((e) =>
                                                            DropdownMenuItem(
                                                              value: e.agencyId,
                                                              child: SizedBox(
                                                                width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width *
                                                                    0.4, // Set a specific width here
                                                                child: Text(
                                                                  e.agencyName!,
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ),
                                                            ))
                                                        .toList(),
                                                    onChanged: (val) {
                                                      val !=
                                                              state.agencies[0]
                                                                  .agencyId
                                                          ? context
                                                              .read<
                                                                  PaymentOutDropDownBloc>()
                                                              .add(
                                                                  AgencyValueChanged(
                                                                      agencyId:
                                                                          val!))
                                                          : {};
                                                    },
                                                    // ignore: body_might_complete_normally_nullable
                                                    validator: (val) {
                                                      if (val ==
                                                          state.agencies[0]
                                                              .agencyId) {
                                                        return 'Please select agency';
                                                      }
                                                    },
                                                  );
                                                }
                                                return CustomDropDown(
                                                    items: nameOfAgency);
                                              },
                                            )
                                          : state.partyType ==
                                                  PartyType.Material
                                              ? BlocBuilder<
                                                      MaterialAgenciesBloc,
                                                      MaterialAgenciesState>(
                                                  builder: (context, state) {
                                                  if (state.state.isLoaded) {
                                                    return PaymentOutCustomDropDown(
                                                      value: state
                                                          .listOfMaterialAgencies[
                                                              0]
                                                          .sId,
                                                      list: state
                                                          .listOfMaterialAgencies
                                                          .map((e) =>
                                                              DropdownMenuItem(
                                                                value: e.sId,
                                                                child: SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.4, // Set a specific width here
                                                                  child: Text(
                                                                    e.name!,
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ),
                                                              ))
                                                          .toList(),
                                                      onChanged: (val) {
                                                        val !=
                                                                state
                                                                    .listOfMaterialAgencies[
                                                                        0]
                                                                    .sId
                                                            ? context
                                                                .read<
                                                                    PaymentOutDropDownBloc>()
                                                                .add(AgencyValueChanged(
                                                                    agencyId:
                                                                        val!))
                                                            : {};
                                                      },
                                                      // ignore: body_might_complete_normally_nullable
                                                      validator: (val) {
                                                        if (val ==
                                                            state
                                                                .listOfMaterialAgencies[
                                                                    0]
                                                                .sId) {
                                                          return 'Please select agency';
                                                        }
                                                      },
                                                    );
                                                  }
                                                  return CustomDropDown(
                                                      items: nameOfAgency);
                                                })
                                              : BlocBuilder<
                                                      GetRentalSuppliersBloc,
                                                      GetRentalSuppliersState>(
                                                  builder: (context, state) {
                                                  if (state.state.isLoaded) {
                                                    return PaymentOutCustomDropDown(
                                                      value: state
                                                          .listOfRentalAgencies[
                                                              0]
                                                          .sId,
                                                      list: state
                                                          .listOfRentalAgencies
                                                          .map((e) =>
                                                              DropdownMenuItem(
                                                                value: e.sId,
                                                                child: SizedBox(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.4, // Set a specific width here
                                                                  child: Text(
                                                                    e.name!,
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ),
                                                              ))
                                                          .toList(),
                                                      onChanged: (val) {
                                                        val !=
                                                                state
                                                                    .listOfRentalAgencies[
                                                                        0]
                                                                    .sId
                                                            ? context
                                                                .read<
                                                                    PaymentOutDropDownBloc>()
                                                                .add(AgencyValueChanged(
                                                                    agencyId:
                                                                        val!))
                                                            : {};
                                                      },
                                                      // ignore: body_might_complete_normally_nullable
                                                      validator: (val) {
                                                        if (val ==
                                                            state
                                                                .listOfRentalAgencies[
                                                                    0]
                                                                .sId) {
                                                          return 'Please select agency';
                                                        }
                                                      },
                                                    );
                                                  }
                                                  return CustomDropDown(
                                                      items: nameOfAgency);
                                                }),
                                      Gap(20.h),
                                      MyCustomTextFormField(
                                        controller: _priceOutController,
                                        hintText: "Payment OUT",
                                        maxLines: 1,
                                        textInputType: TextInputType.number,
                                        // ignore: body_might_complete_normally_nullable
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Please enter payment';
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
                                          if (value == null ||
                                              value.trim().isEmpty) {
                                            return 'Please enter description';
                                          }
                                        },
                                      ),
                                      Gap(30.h),
                                      state.partyType == PartyType.SubContractor
                                          ? BlocListener<PaymentOutDropDownBloc,
                                              PaymentOutDropDownState>(
                                              listener: (context, state) {
                                                if (state
                                                    is PaymentOutAddSuccess) {
                                                  Navigator.pop(context);
                                                  showTopSnackBar(context,
                                                      "Payment added successfully!",
                                                      messageType:
                                                          MessageType.done);
                                                } else if (state
                                                    is PaymentOutAddFailure) {
                                                  Navigator.pop(context);
                                                  showTopSnackBar(context,
                                                      "Payment failed!",
                                                      messageType:
                                                          MessageType.done);
                                                }
                                              },
                                              child: BlocBuilder<
                                                  PaymentOutDropDownBloc,
                                                  PaymentOutDropDownState>(
                                                builder: (context, state) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15.0.w,
                                                            vertical: 10.h),
                                                    child: CustomElevatedButton(
                                                      isLoading: state
                                                          is PaymentOutAddLoading,
                                                      label: 'Payment Out',
                                                      onTap: () async {
                                                        if (formPaymentOutKey
                                                            .currentState!
                                                            .validate()) {
                                                          context
                                                              .read<
                                                                  PaymentOutDropDownBloc>()
                                                              .add(AddPaymentOutTransaction(
                                                                  description:
                                                                      _descriptionController
                                                                          .text,
                                                                  amount:
                                                                      _priceOutController
                                                                          .text));
                                                          context
                                                              .read<
                                                                  TotalPaymentOutBloc>()
                                                              .add(const TotalPaymentOutEvent
                                                                  .fetchTotalPayments());

                                                          _descriptionController
                                                              .clear();
                                                          _priceOutController
                                                              .clear();
                                                        }
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                          : BlocListener<
                                              PaymentOutOtherMaterialAndRentBloc,
                                              PaymentOutOtherMaterialAndRentState>(
                                              listener: (context, state) {
                                                if (state.state.isLoaded) {
                                                  Navigator.pop(context);
                                                  showTopSnackBar(context,
                                                      "Payment added successfully!",
                                                      messageType:
                                                          MessageType.done);
                                                } else if (state
                                                    .state.isError) {
                                                  Navigator.pop(context);
                                                  showTopSnackBar(context,
                                                      "Payment failed!",
                                                      messageType:
                                                          MessageType.done);
                                                }
                                              },
                                              child: BlocBuilder<
                                                  PaymentOutOtherMaterialAndRentBloc,
                                                  PaymentOutOtherMaterialAndRentState>(
                                                builder: (context, state) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 15.0.w,
                                                            vertical: 10.h),
                                                    child: CustomElevatedButton(
                                                      isLoading:
                                                          state.state.isLoading,
                                                      label: 'Payment Out',
                                                      onTap: () async {
                                                        if (formPaymentOutKey
                                                            .currentState!
                                                            .validate()) {
                                                          final state = context
                                                              .read<
                                                                  PaymentOutDropDownBloc>()
                                                              .state;
                                                          context.read<PaymentOutOtherMaterialAndRentBloc>().add(PaymentOutOtherMaterialAndRentEvent.addOtherMaterialAndRent(
                                                              projectId: state
                                                                  .projectValue,
                                                              partieId: state
                                                                  .agencyValue,
                                                              partyType: state
                                                                  .partyType,
                                                              amount:
                                                                  _priceOutController
                                                                      .text,
                                                              description:
                                                                  _descriptionController
                                                                      .text));
                                                          // context
                                                          //     .read<
                                                          //         PaymentOutDropDownBloc>()
                                                          //     .add(AddPaymentOutTransaction(
                                                          //         description:
                                                          //             _descriptionController
                                                          //                 .text,
                                                          //         amount:
                                                          //             _priceOutController
                                                          //                 .text));
                                                          context
                                                              .read<
                                                                  TotalPaymentOutBloc>()
                                                              .add(const TotalPaymentOutEvent
                                                                  .fetchTotalPayments());

                                                          _descriptionController
                                                              .clear();
                                                          _priceOutController
                                                              .clear();
                                                        }
                                                      },
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          )
                        : Form(
                            key: formPaymentOutKey,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.0.w, vertical: 10.h),
                              child: Column(
                                children: [
                                  BlocBuilder<PaymentOutOtherExpenseBloc,
                                      PaymentOutOtherExpenseState>(
                                    builder: (context, state) {
                                      return PaymentOutCustomDropDown(
                                        value: Transaction.payGST,
                                        list: otherExpenses
                                            .map((e) => DropdownMenuItem(
                                                  value: e['value'],
                                                  child: SizedBox(
                                                    width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width *
                                                        0.4, // Set a specific width here
                                                    child: Text(
                                                      e['name'],
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        onChanged: (val) {
                                          context
                                              .read<
                                                  PaymentOutOtherExpenseBloc>()
                                              .add(PaymentOutOtherExpenseEvent
                                                  .onTransactionTypeChanged(
                                                      transationType: val));
                                        },
                                        // ignore: body_might_complete_normally_nullable
                                        validator: (val) {},
                                      );
                                    },
                                  ),
                                  15.hx,
                                  MyCustomTextFormField(
                                    hintText: "Payment",
                                    maxLines: 1,
                                    textInputType: TextInputType.number,
                                    // ignore: body_might_complete_normally_nullable
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter payment';
                                      }
                                      if (double.tryParse(value) == null) {
                                        return 'Please enter valid digit!';
                                      }
                                      if (value.startsWith('-')) {
                                        return 'Please enter valid digit!';
                                      }
                                    },
                                    onChanged: (value) {
                                      context
                                          .read<PaymentOutOtherExpenseBloc>()
                                          .add(PaymentOutOtherExpenseEvent
                                              .onAmountChanged(
                                                  amount: value ?? "0"));
                                    },
                                  ),
                                  15.hx,
                                  MyCustomTextFormField(
                                    hintText: "Description",
                                    maxLines: 3,
                                    textInputType: TextInputType.name,
                                    // ignore: body_might_complete_normally_nullable
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'Please enter description';
                                      }
                                    },
                                    onChanged: (value) {
                                      context
                                          .read<PaymentOutOtherExpenseBloc>()
                                          .add(PaymentOutOtherExpenseEvent
                                              .onDescriptionChanged(
                                                  description: value ?? ""));
                                    },
                                  ),
                                  Gap(30.h),
                                  BlocListener<PaymentOutOtherExpenseBloc,
                                      PaymentOutOtherExpenseState>(
                                    listener: (context, state) {
                                      if (state.state.isLoaded) {
                                        Navigator.pop(context);
                                        showTopSnackBar(context,
                                            "${state.transactionType} is Added",
                                            messageType: MessageType.done);
                                      } else if (state.state.isError) {
                                        Navigator.pop(context);
                                        showTopSnackBar(
                                            context, "Something went wrong!",
                                            messageType: MessageType.error);
                                      }
                                    },
                                    child: BlocBuilder<
                                        PaymentOutOtherExpenseBloc,
                                        PaymentOutOtherExpenseState>(
                                      builder: (context, state) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.0.w,
                                              vertical: 10.h),
                                          child: CustomElevatedButton(
                                            isLoading: state.state.isLoading,
                                            label: 'Payment Out',
                                            onTap: () async {
                                              if (formPaymentOutKey
                                                  .currentState!
                                                  .validate()) {
                                                context
                                                    .read<
                                                        PaymentOutOtherExpenseBloc>()
                                                    .add(PaymentOutOtherExpenseEvent
                                                        .addOtherPaymentOUt());
                                                context
                                                    .read<TotalPaymentOutBloc>()
                                                    .add(const TotalPaymentOutEvent
                                                        .fetchTotalPayments());
                                                context.read<TdsBloc>().add(
                                                    const TdsEvent.fetchTds());
                                                context.read<GstBloc>().add(
                                                    const GstEvent.fetchGst());
                                                context
                                                    .read<OtherExpenseBloc>()
                                                    .add(const OtherExpenseEvent
                                                        .fetchOtherExpenses());
                                              }
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _selectDate(BuildContext context) async {
  DateTime initialDate = DateTime.now();
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null) {
    // ignore: use_build_context_synchronously
    context
        .read<PaymentInDropDownBloc>()
        .add(PaymentInDateChanged(date: pickedDate));
  }
}

class PaymentInWidget extends StatefulWidget {
  const PaymentInWidget({
    super.key,
  });

  @override
  State<PaymentInWidget> createState() => _PaymentInWidgetState();
}

class _PaymentInWidgetState extends State<PaymentInWidget> {
  final TextEditingController _priceInController = TextEditingController();

  final formPaymentInKey = GlobalKey<FormState>();

  final TransactionRepository transactionRepository = TransactionRepositoryImpl(
      transactionDataSource: TransactionDataSourceImpl());
  @override
  void dispose() {
    super.dispose();
    _priceInController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

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
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
              child: Column(
                children: [
                  BlocListener<AddBillingPartyBloc, AddBillingPartyState>(
                    listener: (context, state) {
                      if (state.isAdded == 2) {
                        context
                            .read<PaymentInDropDownBloc>()
                            .add(FetchAgencyInEvent());
                      }
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          context.read<AddPartiesBloc>().add(
                              const AddPartiesEvent.onPartyTypeChange(
                                  partyType: PartyType.BillingParty));
                          context.pushNamed(
                              RoutesName.ADD_BILLING_PARTY_SCREEN_NAME);
                        },
                        child: Text(
                          "Add Agency",
                          style: theme.textTheme.titleMedium?.copyWith(
                              color: purple,
                              decoration: TextDecoration.underline,
                              decorationColor: purple),
                        ),
                      ),
                    ),
                  ),
                  10.hx,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Payment In",
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Gap(20.h),
                  BlocBuilder<PaymentInDropDownBloc, PaymentInDropDownState>(
                    builder: (context, state) {
                      if (state is AgenciesLoadedInState) {
                        return PaymentOutCustomDropDown(
                          value: state.agencies[0].sId,
                          list: state.agencies
                              .map((e) => DropdownMenuItem(
                                    value: e.sId,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
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
                                    .add(AgencyValueInChanged(agencyId: val!))
                                : {};
                          },
                          // ignore: body_might_complete_normally_nullable
                          validator: (val) {
                            if (val == state.agencies[0].sId) {
                              return 'Please select Billing Party';
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
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter payment';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter valid digit!';
                      }
                      if (value.startsWith('-')) {
                        return 'Please enter valid digit!';
                      }
                    },
                  ),
                  Gap(20.h),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 15.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<PaymentInDropDownBloc,
                              PaymentInDropDownState>(
                            builder: (context, state) {
                              final String formattedDate =
                                  DateFormat.yMMMd().format(state.date);
                              return Text("Date: $formattedDate");
                            },
                          ),
                          Icon(
                            Icons.calendar_month,
                            color: theme.canvasColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Gap(15.h),
                  // MyCustomTextFormField(
                  //   controller: _descriptionController,
                  //   hintText: "Description",
                  //   maxLines: 3,
                  //   textInputType: TextInputType.name,
                  //   // ignore: body_might_complete_normally_nullable
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter description!';
                  //     }
                  //   },
                  // ),
                  Gap(30.h),
                  BlocListener<PaymentInDropDownBloc, PaymentInDropDownState>(
                    listener: (context, state) {
                      if (state is PaymentInAddSuccess) {
                        context.read<TotalPaymentOutBloc>().add(
                            const TotalPaymentOutEvent.fetchTotalPayments());
                        Navigator.pop(context);
                        showTopSnackBar(context, 'Transaction added!',
                            messageType: MessageType.done);
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
                              if (formPaymentInKey.currentState!.validate()) {
                                context
                                    .read<PaymentInDropDownBloc>()
                                    .add(AddPaymentInTransaction(
                                      amount: _priceInController.text,
                                    ));
                                context.read<TotalPaymentOutBloc>().add(
                                    TotalPaymentOutEvent.fetchTotalPayments());

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
  }
}

class PaymentOutCustomDropDown extends StatelessWidget {
  final dynamic value;
  final List<DropdownMenuItem<dynamic>> list;
  final String? Function(dynamic val)? validator;
  final void Function(dynamic val) onChanged;
  const PaymentOutCustomDropDown({
    Key? key,
    required this.value,
    required this.list,
    this.validator,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DropdownButtonFormField(
      dropdownColor: theme.scaffoldBackgroundColor,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(7),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          borderSide: const BorderSide(color: grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          borderSide: const BorderSide(color: grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            10.r,
          ),
          borderSide: BorderSide(color: purple),
        ),
      ),
      value: value,
      items: list,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
