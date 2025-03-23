import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/logic/controllers/AddBillingPartyBloc/add_billing_party_bloc.dart';
import 'package:construction_mate/logic/controllers/Parties/add_parties/add_parties_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentTotalProjectWiseBloc/payment_total_project_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/logic/controllers/project_payment_in/project_payment_in_bloc.dart';
import 'package:construction_mate/presentation/router/go_router.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/drop_down.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_bottom_widget.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class PaymentInProjectDialogWidget extends StatelessWidget {
  const PaymentInProjectDialogWidget({
    super.key,
    required this.formPaymentInKey,
    required TextEditingController priceInController,
    required TextEditingController descriptionController,
    required this.projectId,
  })  : _priceInController = priceInController,
        _descriptionController = descriptionController;

  final GlobalKey<FormState> formPaymentInKey;
  final TextEditingController _priceInController;
  final TextEditingController _descriptionController;
  final String projectId;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocListener<AddBillingPartyBloc, AddBillingPartyState>(
                    listener: (context, state) {
                      if (state.isAdded == 2) {
                        context.read<ProjectPaymentInBloc>().add(
                            ProjectPaymentInEvent.fetchAgencies(
                                projectId: projectId));
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
                  Text(
                    "Payment In",
                    style: theme.textTheme.titleLarge,
                  ),
                  Gap(20.h),
                  BlocBuilder<ProjectPaymentInBloc, ProjectPaymentInState>(
                    builder: (context, state) {
                      if (state.agencyState.isLoaded) {
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
                                ? context.read<ProjectPaymentInBloc>().add(
                                    ProjectPaymentInEvent
                                        .onAgencyDropDownValueChanged(
                                            agencyDropDownValue: val!))
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
                    onChanged: (value) {
                      context.read<ProjectPaymentInBloc>().add(
                          ProjectPaymentInEvent.onPaymentInChanged(
                              payment: value ?? '0'));
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
                    onChanged: (value) {
                      context.read<ProjectPaymentInBloc>().add(
                          ProjectPaymentInEvent.onDescriptionChanged(
                              des: value ?? ''));
                    },
                  ),
                  Gap(30.h),
                  BlocListener<ProjectPaymentInBloc, ProjectPaymentInState>(
                    listener: (context, state) {
                      if (state.state.isLoaded) {
                        showTopSnackBar(context, "Transaction added",
                            messageType: MessageType.done);
                        context.read<PaymentTotalProjectBloc>().add(
                            PaymentTotalProjectEvent.fetchAllTotalPayments(
                                projectId: projectId));
                        context.read<TotalPaymentOutBloc>().add(
                            const TotalPaymentOutEvent.fetchTotalPayments());
                        Navigator.pop(context);
                      }
                    },
                    child: BlocBuilder<ProjectPaymentInBloc,
                        ProjectPaymentInState>(
                      builder: (context, state) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: CustomElevatedButton(
                            isLoading: state.state.isLoading,
                            label: 'Payment In',
                            onTap: () async {
                              if (formPaymentInKey.currentState!.validate()) {
                                context.read<ProjectPaymentInBloc>().add(
                                    const ProjectPaymentInEvent.addPaymentIn());

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
  }
}
