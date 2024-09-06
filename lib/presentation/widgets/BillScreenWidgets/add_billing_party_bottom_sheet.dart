import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/logic/controllers/AddBillingPartyBloc/add_billing_party_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/custom_drop_down_agency.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/drop_down.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyAddBillingPartyBottomSheet extends StatefulWidget {
  const MyAddBillingPartyBottomSheet({super.key});

  @override
  State<MyAddBillingPartyBottomSheet> createState() =>
      _MyAddBillingPartyBottomSheetState();
}

class _MyAddBillingPartyBottomSheetState
    extends State<MyAddBillingPartyBottomSheet> {
  final _billingFormKey = GlobalKey<FormState>();
  final TextEditingController _billingPartyNameController =
      TextEditingController();
  final TextEditingController _gstNoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactNoController = TextEditingController();
  final TextEditingController _shippingAddressController =
      TextEditingController();
  final TextEditingController _billingAddressController =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AddBillingPartyBloc>().add(LoadProjectsBillingEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _billingAddressController.dispose();
    _gstNoController.dispose();
    _billingPartyNameController.dispose();
    _emailController.dispose();
    _contactNoController.dispose();
    _shippingAddressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
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
          child: Column(
            children: [
              Container(
                height: 5.w,
                width: 50.w,
                margin: EdgeInsets.symmetric(vertical: 15.h),
                decoration: BoxDecoration(
                    color: grey, borderRadius: BorderRadius.circular(8)),
              ),
              Form(
                key: _billingFormKey,
                child: Column(
                  children: [
                    BlocBuilder<AddBillingPartyBloc, AddBillingPartyState>(
                        builder: (context, state) {
                      if (!state.isLoadingProject) {
                        return CustomDropDown(items: selectProject);
                      }
                      return PaymentOutCustomDropDown(
                          value: state.projects[0].sId,
                          list: state.projects
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
                          onChanged: (val) {},
                          validator: (val) {
                            if (val == state.projects[0].sId) {
                              return 'Please select one of the projects!';
                            }
                          });
                    }),
                    Gap(10.h),
                    MyCustomTextFormField(
                      controller: _billingPartyNameController,
                      hintText: "Party name",
                      maxLines: 1,
                      textInputType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please add party name!';
                        }
                      },
                    ),
                    Gap(10.h),
                    MyCustomTextFormField(
                      controller: _gstNoController,
                      hintText: "GST No.",
                      maxLines: 1,
                      maxLength: 15,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please add foot per floor!';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter valid digit!';
                        }
                        if (value.startsWith('-')) {
                          return 'Please enter valid digit!';
                        }
                      },
                    ),
                    Gap(10.h),
                    MyCustomTextFormField(
                      controller: _emailController,
                      hintText: "Emailaddress",
                      maxLines: 1,
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please add email address!';
                        }
                      },
                    ),
                    Gap(10.h),
                    MyCustomTextFormField(
                      controller: _contactNoController,
                      hintText: "Contatct No.",
                      maxLines: 1,
                      maxLength: 10,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please add contact no.!';
                        }
                      },
                    ),
                    Gap(10.h),
                    MyCustomTextFormField(
                      controller: _shippingAddressController,
                      hintText: "Shipping Address",
                      maxLines: 3,
                      textInputType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please add shipping address!';
                        }
                      },
                    ),
                    Gap(10.h),
                    MyCustomTextFormField(
                      controller: _billingAddressController,
                      hintText: "Billing Address",
                      maxLines: 3,
                      textInputType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please add billing address!';
                        }
                      },
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: () {
                              _billingAddressController.text =
                                  _shippingAddressController.text;
                            },
                            child: Text(
                              "Same as Shipping Address ",
                              style: theme.textTheme.titleMedium!
                                  .copyWith(fontSize: 14),
                            ))),
                    Gap(20.h),
                    MyCustomButton(
                        buttonName: 'Add Party',
                        color: green,
                        style: TextStyle(),
                        onPressed: () {}),
                    Gap(10.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
