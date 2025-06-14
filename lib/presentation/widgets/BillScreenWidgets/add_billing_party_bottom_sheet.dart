import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/AddBillingPartyBloc/add_billing_party_bloc.dart';
import 'package:construction_mate/logic/controllers/BillingPartiesHomeBloc/billing_parties_home_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';

import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/drop_down.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_bottom_widget.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
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
    context.read<AddBillingPartyBloc>().add(Initialize());
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

  bool isSame = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        surfaceTintColor: transparent,
        title: Text(
          "Add Billing Party",
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Form(
                key: _billingFormKey,
                child: Column(
                  children: [
                    10.hx,
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
                          onChanged: (val) {
                            context.read<AddBillingPartyBloc>().add(
                                BillingProjectValueChanged(projectValue: val));
                          },
                          validator: (val) {
                            if (val == state.projects[0].sId) {
                              return 'Please select project';
                            }
                          });
                    }),
                    Gap(10.h),
                    MyCustomTextFormField(
                      controller: _billingPartyNameController,
                      textInputAction: TextInputAction.next,
                      hintText: "Party name",
                      maxLines: 1,
                      textInputType: TextInputType.name,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !ReusableFunctions.isValidInput(value)) {
                          return 'Please add party name';
                        }
                      },
                    ),
                    Gap(10.h),
                    MyCustomTextFormField(
                      controller: _gstNoController,
                      textInputAction: TextInputAction.next,
                      hintText: "GST No.",
                      maxLines: 1,
                      maxLength: 15,
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please add GST Number';
                        }
                       
                        if (value.startsWith('-')) {
                          return 'Please enter valid digit!';
                        }
                        if (value.length < 15) {
                          return 'Please enter correct GST number';
                        }
                      },
                    ),
                    Gap(10.h),
                    MyCustomTextFormField(
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      hintText: "Email",
                      maxLines: 1,
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please add email address';
                        }
                        final emailRegex = RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                        if (!emailRegex.hasMatch(value.trim())) {
                          return 'Please enter a valid email address!';
                        }
                      },
                    ),
                    Gap(10.h),
                    MyCustomTextFormField(
                      controller: _contactNoController,
                      textInputAction: TextInputAction.next,
                      hintText: "Contatct No.",
                      maxLines: 1,
                      maxLength: 10,
                      textInputType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please add contact no.';
                        }
                        if (value.length < 10) {
                          return 'Please enter correct contact no.';
                        }
                      },
                    ),
                    Gap(10.h),
                    MyCustomTextFormField(
                      controller: _shippingAddressController,
                      textInputAction: TextInputAction.next,
                      hintText: "Shipping Address",
                      maxLines: 3,
                      textInputType: TextInputType.name,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !ReusableFunctions.isValidInput(value)) {
                          return 'Please add shipping address';
                        }
                      },
                    ),
                    Gap(10.h),
                    MyCustomTextFormField(
                      controller: _billingAddressController,
                      textInputAction: TextInputAction.next,
                      hintText: "Billing Address",
                      maxLines: 3,
                      textInputType: TextInputType.name,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !ReusableFunctions.isValidInput(value)) {
                          return 'Please add billing address';
                        }
                      },
                    ),
                    Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            isSame
                                ? _billingAddressController.text =
                                    _shippingAddressController.text
                                : _billingAddressController.clear();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Checkbox(
                                  activeColor: purple,
                                  value: isSame,
                                  onChanged: (val) {
                                    setState(() {
                                      isSame = val ?? false;
                                      isSame
                                          ? _billingAddressController.text =
                                              _shippingAddressController.text
                                          : _billingAddressController.clear();
                                    });
                                  }),
                              Text(
                                "Same as Shipping Address ",
                                style: theme.textTheme.titleMedium!
                                    .copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        )),
                    Gap(10.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          BlocConsumer<AddBillingPartyBloc, AddBillingPartyState>(
        listener: (context, state) {
          if (state.isAdded == 2) {
            context
                .read<BillingPartiesHomeBloc>()
                .add(BillingPartiesLoadEvent());
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
              child: CustomElevatedButton(
                  label: "Add Party",
                  isLoading: state.isAdded == 1,
                  onTap: () {
                    if (_billingFormKey.currentState!.validate()) {
                      context.read<AddBillingPartyBloc>().add(AddBillingParty(
                          partyName: _billingPartyNameController.text,
                          email: _emailController.text,
                          gstNo: _gstNoController.text,
                          contactNo: _contactNoController.text,
                          shippingAddress: _shippingAddressController.text,
                          billingAddress: _billingAddressController.text));
                    }
                  }),
            ),
          );
        },
      ),
    );
  }
}
