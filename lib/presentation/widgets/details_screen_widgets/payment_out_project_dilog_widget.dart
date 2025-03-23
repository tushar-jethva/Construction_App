import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/Material/material_agencies/material_agencies_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentOutDropDownBloc/payment_out_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentOutOtherMaterailAndRentBloc/payment_out_other_material_and_rent_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentTotalProjectWiseBloc/payment_total_project_bloc.dart';
import 'package:construction_mate/logic/controllers/Rent/get_rental_suppliers/get_rental_suppliers_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/logic/controllers/TransactionBuilding/transaction_building_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/drop_down.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_bottom_widget.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../common/custom_text_form_field.dart';

class PaymentOutProjectDialogBoxWidget extends StatelessWidget {
  const PaymentOutProjectDialogBoxWidget({
    super.key,
    required this.formPaymentOutKey,
    required this.projectId,
    required this.projectName,
    required TextEditingController priceOutController,
    required TextEditingController descriptionController,
  })  : _priceOutController = priceOutController,
        _descriptionController = descriptionController;

  final GlobalKey<FormState> formPaymentOutKey;
  final String projectId;
  final String projectName;
  final TextEditingController _priceOutController;
  final TextEditingController _descriptionController;

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
            key: formPaymentOutKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
              child:
                  BlocBuilder<PaymentOutDropDownBloc, PaymentOutDropDownState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment Out",
                        style: theme.textTheme.titleLarge,
                      ),
                      20.hx,
                      CustomDropDown(
                        items: const [
                          '-Select Agency Type-',
                          "Labour",
                          "Material supplier",
                          "Equipment supplier"
                        ],
                        onChanged: (val) {
                          final selectedPartyType = PartyType.values.firstWhere(
                            (e) {
                              return e.apiValue == val;
                            },
                            orElse: () => PartyType
                                .BillingParty, // default value if not found
                          );

                          context.read<PaymentOutDropDownBloc>().add(
                                AgencyTypeChangeEvent(
                                    partyType: selectedPartyType),
                              );
                        },
                        initialValue: '-Select Agency Type-',
                      ),
                      15.hx,
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
                              hintText: projectName,
                            ),
                          )),
                      state.partyType == PartyType.SubContractor
                          ? Column(
                              children: [
                                15.hx,
                                BlocBuilder<PaymentOutDropDownBloc,
                                    PaymentOutDropDownState>(
                                  builder: (context, state) {
                                    if (state is BuildingsLoadingState) {
                                      return CustomDropDown(
                                          items: selectBuilding);
                                    } else if (state is BuildingsLoadedState ||
                                        state is AgenciesLoadedState) {
                                      return PaymentOutCustomDropDown(
                                        value: state.buildingValue,
                                        list: state.buildings
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
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        onChanged: (val) {
                                          val != state.buildings[0].sId
                                              ? context
                                                  .read<
                                                      PaymentOutDropDownBloc>()
                                                  .add(FetchAgenciesEvent2(
                                                      val!, state.projectValue))
                                              : {};
                                        },
                                        // ignore: body_might_complete_normally_nullable
                                        validator: (val) {
                                          if (val == state.buildings[0].sId) {
                                            return 'Please select building';
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
                      15.hx,
                      state.partyType == PartyType.SubContractor
                          ? BlocBuilder<PaymentOutDropDownBloc,
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
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                            )
                          : state.partyType == PartyType.Material
                              ? BlocBuilder<MaterialAgenciesBloc,
                                      MaterialAgenciesState>(
                                  builder: (context, state) {
                                  if (state.state.isLoaded) {
                                    return PaymentOutCustomDropDown(
                                      value:
                                          state.listOfMaterialAgencies[0].sId,
                                      list: state.listOfMaterialAgencies
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        val !=
                                                state.listOfMaterialAgencies[0]
                                                    .sId
                                            ? context
                                                .read<PaymentOutDropDownBloc>()
                                                .add(AgencyValueChanged(
                                                    agencyId: val!))
                                            : {};
                                      },
                                      // ignore: body_might_complete_normally_nullable
                                      validator: (val) {
                                        if (val ==
                                            state.listOfMaterialAgencies[0]
                                                .sId) {
                                          return 'Please select agency';
                                        }
                                      },
                                    );
                                  }
                                  return CustomDropDown(items: nameOfAgency);
                                })
                              : BlocBuilder<GetRentalSuppliersBloc,
                                      GetRentalSuppliersState>(
                                  builder: (context, state) {
                                  if (state.state.isLoaded) {
                                    return PaymentOutCustomDropDown(
                                      value: state.listOfRentalAgencies[0].sId,
                                      list: state.listOfRentalAgencies
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        val != state.listOfRentalAgencies[0].sId
                                            ? context
                                                .read<PaymentOutDropDownBloc>()
                                                .add(AgencyValueChanged(
                                                    agencyId: val!))
                                            : {};
                                      },
                                      // ignore: body_might_complete_normally_nullable
                                      validator: (val) {
                                        if (val ==
                                            state.listOfRentalAgencies[0].sId) {
                                          return 'Please select agency';
                                        }
                                      },
                                    );
                                  }
                                  return CustomDropDown(items: nameOfAgency);
                                }),
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
                      state.partyType == PartyType.SubContractor
                          ? BlocListener<PaymentOutDropDownBloc,
                              PaymentOutDropDownState>(
                              listener: (context, state) {
                                if (state is PaymentOutAddSuccess) {
                                  context.read<PaymentTotalProjectBloc>().add(
                                      PaymentTotalProjectEvent
                                          .fetchAllTotalPayments(
                                              projectId: projectId));
                                  context.read<TotalPaymentOutBloc>().add(
                                      const TotalPaymentOutEvent
                                          .fetchTotalPayments());
                                  context.read<TransactionBuildingBloc>().add(
                                      FetchAllTransactionByProjectId(
                                          projectId: projectId));
                                  showTopSnackBar(context,
                                      "Transaction added successfully!",
                                      messageType: MessageType.done);

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
                                                  amount:
                                                      _priceOutController.text,
                                                  description:
                                                      _descriptionController
                                                          .text));
                                        }
                                      });
                                },
                              ),
                            )
                          : BlocListener<PaymentOutOtherMaterialAndRentBloc,
                              PaymentOutOtherMaterialAndRentState>(
                              listener: (context, state) {
                                if (state.state.isLoaded) {
                                  Navigator.pop(context);
                                  showTopSnackBar(
                                      context, "Payment added successfully!",
                                      messageType: MessageType.done);
                                  context.read<PaymentTotalProjectBloc>().add(
                                      PaymentTotalProjectEvent
                                          .fetchAllTotalPayments(
                                              projectId: projectId));
                                  context.read<TransactionBuildingBloc>().add(
                                      FetchAllTransactionByProjectId(
                                          projectId: projectId));
                                  context.read<TotalPaymentOutBloc>().add(
                                      const TotalPaymentOutEvent
                                          .fetchTotalPayments());
                                } else if (state.state.isError) {
                                  Navigator.pop(context);
                                  showTopSnackBar(context, "Payment failed!",
                                      messageType: MessageType.done);
                                }
                              },
                              child: BlocBuilder<
                                  PaymentOutOtherMaterialAndRentBloc,
                                  PaymentOutOtherMaterialAndRentState>(
                                builder: (context, state) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.0.w, vertical: 10.h),
                                    child: CustomElevatedButton(
                                      isLoading: state.state.isLoading,
                                      label: 'Payment Out',
                                      onTap: () async {
                                        if (formPaymentOutKey.currentState!
                                            .validate()) {
                                          final state = context
                                              .read<PaymentOutDropDownBloc>()
                                              .state;

                                          context
                                              .read<
                                                  PaymentOutOtherMaterialAndRentBloc>()
                                              .add(PaymentOutOtherMaterialAndRentEvent
                                                  .addOtherMaterialAndRent(
                                                      projectId: projectId,
                                                      partieId:
                                                          state.agencyValue,
                                                      partyType:
                                                          state.partyType,
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
                                              .read<TotalPaymentOutBloc>()
                                              .add(const TotalPaymentOutEvent
                                                  .fetchTotalPayments());

                                          _descriptionController.clear();
                                          _priceOutController.clear();
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
          ),
        ),
      ),
    );
  }
}
