import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/PaymentInDropDownBloc/payment_in_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentTotalProjectWiseBloc/payment_total_project_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/presentation/screens/authentication/signin/sign_in_screen.dart';
import 'package:construction_mate/presentation/screens/project/building_screen.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/drop_down.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PaymentInProjectDialogWidget extends StatelessWidget {
  const PaymentInProjectDialogWidget({
    super.key,
    required this.mediaQueryData,
    required this.formPaymentInKey,
    required TextEditingController priceInController,
    required TextEditingController descriptionController,
    required this.projectId,
  })  : _priceInController = priceInController,
        _descriptionController = descriptionController;

  final MediaQueryData mediaQueryData;
  final GlobalKey<FormState> formPaymentInKey;
  final TextEditingController _priceInController;
  final TextEditingController _descriptionController;
  final String projectId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  Text(
                    "Payment In",
                    style: theme.textTheme.titleLarge,
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
                  BlocListener<PaymentInDropDownBloc, PaymentInDropDownState>(
                    listener: (context, state) {
                      if (state is PaymentInAddSuccess) {
                        showTopSnackBar(context, "Transaction added");
                        // "Transaction Added".showToast(context: context)
                        context.read<PaymentTotalProjectBloc>().add(
                            PaymentTotalProjectEvent.fetchAllTotalPayments(
                                projectId: projectId));
                        context.read<TotalPaymentOutBloc>().add(
                            const TotalPaymentOutEvent.fetchTotalPayments());
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
                              if (formPaymentInKey.currentState!.validate()) {
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
  }
}
