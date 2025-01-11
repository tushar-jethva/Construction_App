// ignore_for_file: use_build_context_synchronously

import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/AddMaterialBloc/add_material_bloc.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/logic/models/material_model.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/common_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/drop_down.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class MyMaterialAddBottomSheet extends StatefulWidget {
  final String projectId;
  final MaterialModel material;
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
    _materialNameController.text = widget.material.materialName;
    _quantityController.text = widget.material.quantity;
    _descriptionController.text = widget.material.description;
    context.read<AddMaterialBloc>().add(
        AddMaterialEvent.onDateChanged(date: widget.material.date.toString()));
    context
        .read<AddMaterialBloc>()
        .add(AddMaterialEvent.onUnitChanged(unit: widget.material.unit));
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
                        CustomTextFormField(
                          controller: _materialNameController,
                          hintText: 'Material Name',
                          maxLines: 1,
                          textInputType: TextInputType.name,
                          customvalidation: "Add material name!",
                        ),
                        15.hx,
                        CustomTextFormField(
                          controller: _quantityController,
                          hintText: 'Project Quantity',
                          maxLines: 1,
                          textFieldType: TextFieldType.number,
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
                        CustomTextFormField(
                          controller: _descriptionController,
                          hintText: 'Project Description',
                          maxLines: 3,
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
                              if (_formKeyMaterial.currentState!.validate()) {
                                context.read<AddMaterialBloc>().add(
                                    AddMaterialEvent.onAddMaterialTap(
                                        materialId: material.id ?? "",
                                        isUpdate: widget.isUpdate ?? false,
                                        projectId: widget.projectId,
                                        materialName:
                                            _materialNameController.text,
                                        quantity: _quantityController.text,
                                        description:
                                            _descriptionController.text));
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
    );
  }
}

List<String> units = ["-- Select Unit --", "bags", "liter"];
