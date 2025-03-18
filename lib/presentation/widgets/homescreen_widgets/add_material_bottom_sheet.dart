// ignore_for_file: use_build_context_synchronously

import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/AddMaterialBloc/add_material_bloc.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/logic/controllers/Material/material_agencies/material_agencies_bloc.dart';
import 'package:construction_mate/logic/models/get_material_model.dart';
import 'package:construction_mate/logic/models/material_model.dart';
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

class MyMaterialAddBottomSheet extends StatefulWidget {
  final String projectId;
  final GetMaterialModel material;
  final bool? isUpdate;
  const MyMaterialAddBottomSheet(
      {super.key,
      required this.projectId,
      required this.material,
      this.isUpdate = false});

  @override
  State<MyMaterialAddBottomSheet> createState() =>
      _MyMaterialAddBottomSheetState();
}

class _MyMaterialAddBottomSheetState extends State<MyMaterialAddBottomSheet> {
  //Textform fields
  late final TextEditingController _materialNameController =
      TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();
  final TextEditingController _pricePerUnitController = TextEditingController();
  final TextEditingController _hsnCodeController = TextEditingController();

  String dropDownValue = units[0];

  final _formKeyMaterial = GlobalKey<FormState>();
  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      context
          .read<DateBlocBloc>()
          .add(DateBlocEvent.onDateChanged(dateTime: pickedDate));

      context
          .read<AddMaterialBloc>()
          .add(AddMaterialEvent.onDateChanged(date: pickedDate.toString()));
    }
  }

  @override
  void initState() {
    super.initState();
    widget.isUpdate == true ? setController() : ();
  }

  //Set controller text
  setController() {
    _materialNameController.text = widget.material.name ?? '';
    _quantityController.text = (widget.material.quantity ?? 0).toString();
    _descriptionController.text = widget.material.description ?? '';
    _gstController.text = (widget.material.gst ?? 0).toString();
    _pricePerUnitController.text =
        (widget.material.priceperunit ?? 0).toString();
    _hsnCodeController.text = (widget.material.hashCode ?? 0).toString();

    context.read<AddMaterialBloc>().add(
        AddMaterialEvent.onDateChanged(date: widget.material.date.toString()));
    context
        .read<AddMaterialBloc>()
        .add(AddMaterialEvent.onUnitChanged(unit: widget.material.unit ?? ''));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _materialNameController.dispose();
    _quantityController.dispose();
    _descriptionController.dispose();
    _gstController.dispose();
    _pricePerUnitController.dispose();
    _hsnCodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final material = widget.material;
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
              topRight: Radius.circular(15.r),
            ),
          ),
          child: BlocBuilder<AddMaterialBloc, AddMaterialState>(
            builder: (context, state) {
              return Column(
                children: [
                  Form(
                    key: _formKeyMaterial,
                    child: Column(
                      children: [
                        BlocBuilder<MaterialAgenciesBloc,
                            MaterialAgenciesState>(
                          builder: (context, state) {
                            return state.state.isLoaded
                                ? PaymentOutCustomDropDown(
                                    value: state.listOfMaterialAgencies[0].sId,
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
                                      val != state.listOfMaterialAgencies[0].sId
                                          ? context
                                              .read<MaterialAgenciesBloc>()
                                              .add(MaterialAgenciesEvent
                                                  .onChangeMaterialAgency(
                                                      materialAgency: val))
                                          : {};
                                    },
                                    // ignore: body_might_complete_normally_nullable
                                    validator: (val) {
                                      if (val ==
                                          state.listOfMaterialAgencies[0].sId) {
                                        return 'Please select one of the agency!';
                                      }
                                    },
                                  )
                                : CustomDropDown(items: nameOfAgency);
                          },
                        ),
                        15.hx,
                        CustomDropDown(
                          initialValue:
                              widget.isUpdate == true ? state.unit : null,
                          items: units,
                          onChanged: (val) {
                            context.read<AddMaterialBloc>().add(
                                AddMaterialEvent.onUnitChanged(
                                    unit: val ?? ""));
                          },
                        ),
                        15.hx,
                        MyCustomTextFormField(
                          controller: _materialNameController,
                          hintText: 'Material Name',
                          maxLines: 1,
                          textInputType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (!ReusableFunctions.isValidInput(value ?? '')) {
                              return 'Enter destination';
                            }
                          },
                        ),
                        15.hx,
                        MyCustomTextFormField(
                          controller: _quantityController,
                          hintText: 'Project Quantity',
                          maxLines: 1,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter project quantity';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter valid digit!';
                            }
                            if (value.startsWith('-')) {
                              return 'Please enter valid digit!';
                            }
                          },
                        ),
                        15.hx,
                        MyCustomTextFormField(
                          controller: _pricePerUnitController,
                          hintText: 'Price Per Unit',
                          maxLines: 1,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter project quantity';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter valid digit!';
                            }
                            if (value.startsWith('-')) {
                              return 'Please enter valid digit!';
                            }
                          },
                        ),
                        15.hx,
                        MyCustomTextFormField(
                          controller: _gstController,
                          hintText: 'GST',
                          maxLines: 1,
                          maxLength: 11,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter project quantity';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter valid digit!';
                            }
                            if (value.startsWith('-')) {
                              return 'Please enter valid digit!';
                            }
                          },
                        ),
                        15.hx,
                        MyCustomTextFormField(
                          controller: _hsnCodeController,
                          hintText: 'HSN Code',
                          maxLines: 1,
                          textInputType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter project quantity';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Please enter valid digit!';
                            }
                            if (value.startsWith('-')) {
                              return 'Please enter valid digit!';
                            }
                          },
                        ),
                        15.hx,
                        MyCustomTextFormField(
                          controller: _descriptionController,
                          hintText: 'Project Description',
                          maxLines: 3,
                          textInputType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (!ReusableFunctions.isValidInput(value ?? '')) {
                              return 'Enter destination';
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Gap(15.h),
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
                          Text(
                              "Date: ${ReusableFunctions.getFormattedDate(state.date)}"),
                          Icon(
                            Icons.calendar_month,
                            color: theme.canvasColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(20.h),
                  BlocListener<AddMaterialBloc, AddMaterialState>(
                    listener: (context, state) {
                      if (state.state.isLoaded) {
                        context.pop();
                        context.read<AddMaterialBloc>().add(
                            AddMaterialEvent.fetchAllMaterial(
                                projectId: widget.projectId));
                      }
                    },
                    child: BlocBuilder<AddMaterialBloc, AddMaterialState>(
                      builder: (context, state) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: CustomElevatedButton(
                            isLoading: state.state.isLoading,
                            label: widget.isUpdate == true
                                ? 'Update'
                                : 'Add Material',
                            onTap: () async {
                              if (!_formKeyMaterial.currentState!.validate()) {
                              } else if (int.parse(_quantityController.text) <=
                                  0) {
                                showTopSnackBar(context, "Enter valid quantity",
                                    messageType: MessageType.warning);
                              } else {
                                context.read<AddMaterialBloc>().add(
                                    AddMaterialEvent.onAddMaterialTap(
                                        materialId: material.sId ?? "",
                                        isUpdate: widget.isUpdate ?? false,
                                        projectId: widget.projectId,
                                        materialName:
                                            _materialNameController.text,
                                        quantity: _quantityController.text,
                                        gst: _gstController.text,
                                        pricePerUnit:
                                            _pricePerUnitController.text,
                                        hsnCode: _hsnCodeController.text,
                                        description:
                                            _descriptionController.text));
                              }
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  20.hx,
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

List<String> units = ["-- Select Unit --", "bags", "liter"];
