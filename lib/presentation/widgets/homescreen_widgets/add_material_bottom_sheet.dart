import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/logic/controllers/AddMaterialBloc/add_material_bloc.dart';
import 'package:construction_mate/logic/controllers/DateBloc/date_bloc_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/custom_button_with_widget.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/custom_textfield.dart';
import 'package:construction_mate/presentation/widgets/common/drop_down.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class MyMaterialAddBottomSheet extends StatefulWidget {
  const MyMaterialAddBottomSheet({super.key});

  @override
  State<MyMaterialAddBottomSheet> createState() =>
      _MyMaterialAddBottomSheetState();
}

class _MyMaterialAddBottomSheetState extends State<MyMaterialAddBottomSheet> {
  final TextEditingController _materialNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

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
      // ignore: use_build_context_synchronously
      context.read<DateBlocBloc>().add(DateChanged(dateTime: pickedDate));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _materialNameController.dispose();
    _descriptionController.dispose();
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
              topRight: Radius.circular(15.r),
            ),
          ),
          child: Column(
            children: [
              Form(
                key: _formKeyMaterial,
                child: Column(
                  children: [
                    BlocBuilder<AddMaterialBloc, AddMaterialState>(
                        builder: (context, state) {
                      print(state.isLoading);
                      if (state.isLoading) {
                        return CustomDropDown(items: selectProject);
                      }
                      return Column(
                        children: [
                          PaymentOutCustomDropDown(
                            value: state.projectValue.isNotEmpty
                                ? state.projectValue
                                : state.projects[0].sId,
                            list: state.projects
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
                              context.read<AddMaterialBloc>().add(
                                  OnProjectValueChangedEvent(projectId: val!));
                            },
                            // ignore: body_might_complete_normally_nullable
                          ),
                        ],
                      );
                    }),
                    Gap(15.h),
                    MyCustomTextFormField(
                      controller: _materialNameController,
                      hintText: 'Material Name',
                      maxLines: 1,
                      textInputType: TextInputType.name,
                      // ignore: body_might_complete_normally_nullable
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter material name!';
                        }
                      },
                    ),
                    Gap(15.h),
                    MyCustomTextField(
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
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<DateBlocBloc, DateBlocState>(
                        builder: (context, state) {
                          final String formattedDate =
                              DateFormat.yMMMd().format(state.selectedDate);
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
              Gap(20.h),
              BlocListener<AddMaterialBloc, AddMaterialState>(
                listener: (context, state) {
                  // if (state is ProjectAddSuccess) {
                  //   Navigator.pop(context);
                  //   ReusableFunctions.showSnackBar(
                  //       context: context, content: "Project add successfully!");
                  // }
                },
                child: BlocBuilder<AddMaterialBloc, AddMaterialState>(
                  builder: (context, state) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: MyCustomButtonWidget(
                        widget: const Text(
                          'Add Material',
                          style: TextStyle(
                              color: white, fontWeight: FontWeight.w500),
                        ),
                        color: green,
                        onPressed: () async {
                          if (_formKeyMaterial.currentState!.validate()) {}
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
    );
  }
}
