import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/AddBillingPartyBloc/add_billing_party_bloc.dart';
import 'package:construction_mate/logic/controllers/Material/MaterialSupplier/material_supplier_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyMaterialPartyBottomSheet extends StatefulWidget {
  const MyMaterialPartyBottomSheet({super.key});

  @override
  State<MyMaterialPartyBottomSheet> createState() =>
      _MyMaterialPartyBottomSheetState();
}

class _MyMaterialPartyBottomSheetState
    extends State<MyMaterialPartyBottomSheet> {
  final _materialFormKey = GlobalKey<FormState>();

  final TextEditingController _materialPartyNameController =
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
    _materialPartyNameController.dispose();
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
        title: Text(
          "Add Material Supplier",
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r))),
        child: Column(
          children: [
            Form(
              key: _materialFormKey,
              child: Column(
                children: [
                  10.hx,
                  MyCustomTextFormField(
                    controller: _materialPartyNameController,
                    textInputAction: TextInputAction.next,
                    hintText: "Party name",
                    maxLines: 1,
                    textInputType: TextInputType.name,
                    onChanged: (value) {
                      context.read<MaterialSupplierBloc>().add(
                            MaterialSupplierEvent.partyNameChanged(
                                partyName: value ?? ''),
                          );
                    },
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
                    onChanged: (value) {
                      context.read<MaterialSupplierBloc>().add(
                            MaterialSupplierEvent.gstNoChanged(
                                gstNo: value ?? ''),
                          );
                    },
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        
                        if (value.startsWith('-')) {
                          return 'Please enter valid digit';
                        }
                        if (value.length < 15) {
                          return 'Please enter correct GST number';
                        }
                      }
                      return null;
                    },
                  ),
                  Gap(10.h),
                  MyCustomTextFormField(
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    hintText: "Email",
                    maxLines: 1,
                    textInputType: TextInputType.emailAddress,
                    onChanged: (value) {
                      context.read<MaterialSupplierBloc>().add(
                            MaterialSupplierEvent.emailChanged(
                                email: value ?? ''),
                          );
                    },
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        final emailRegex = RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                        if (!emailRegex.hasMatch(value.trim())) {
                          return 'Please enter a valid email address';
                        }
                      }

                      return null;
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
                    onChanged: (value) {
                      context.read<MaterialSupplierBloc>().add(
                            MaterialSupplierEvent.contactNoChanged(
                                contactNo: value ?? ''),
                          );
                    },
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        if (value.length < 10) {
                          return 'Please enter correct Contact No.';
                        }
                      }
                      return null;
                    },
                  ),
                  Gap(10.h),
                  MyCustomTextFormField(
                    controller: _shippingAddressController,
                    textInputAction: TextInputAction.next,
                    hintText: "Address",
                    maxLines: 3,
                    textInputType: TextInputType.name,
                    onChanged: (value) {
                      context.read<MaterialSupplierBloc>().add(
                            MaterialSupplierEvent.addressChanged(
                                address: value ?? ''),
                          );
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),
            BlocConsumer<MaterialSupplierBloc, MaterialSupplierState>(
              listener: (context, state) {
                if (state.state.isLoaded) {
                  showTopSnackBar(
                      context, "Material Supplier Added Successfully",
                      messageType: MessageType.done);

                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CustomElevatedButton(
                      label: "Add Material Supplier",
                      isLoading: state.state.isLoading,
                      onTap: () {
                        if (_materialFormKey.currentState!.validate()) {
                          context.read<MaterialSupplierBloc>().add(
                                const MaterialSupplierEvent
                                    .addMaterialSupplier(),
                              );
                        }
                      }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
