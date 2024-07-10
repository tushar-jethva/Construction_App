import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/logic/controllers/AddAgencyDropDowns/add_agency_drop_downs_bloc.dart';
import 'package:construction_mate/logic/controllers/PerBuildingAgency/per_building_agencies_bloc.dart';
import 'package:construction_mate/logic/controllers/SelectFloorsBloc/select_floors_bloc.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:construction_mate/presentation/widgets/common/custom_drop_down_form_fields.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../logic/models/building_model.dart';

class MyAddAgencyBottomSheet extends StatefulWidget {
  final BuildingModel buildingModel;
  MyAddAgencyBottomSheet({super.key, required this.buildingModel});

  @override
  State<MyAddAgencyBottomSheet> createState() => _MyAddAgencyBottomSheetState();
}

class _MyAddAgencyBottomSheetState extends State<MyAddAgencyBottomSheet> {
  final TextEditingController _pricePerFeetController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pricePerFeetController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 7.w,
                  width: 50.w,
                  margin: EdgeInsets.only(bottom: 12.h),
                  decoration: BoxDecoration(
                      color: grey, borderRadius: BorderRadius.circular(8)),
                ),
                Row(
                  children: [
                    const Text(
                      "Work Type: ",
                      style: TextStyle(fontSize: 16),
                    ),
                    Expanded(
                      child: BlocBuilder<AddAgencyDropDownsBloc,
                          AddAgencyDropDownsState>(
                        builder: (context, state) {
                          return MyDropDownFormField(
                            items: workType,
                            event: (value) =>
                                DropdownWorkTypeChangedEvent(value),
                          );
                        },
                      ),
                    )
                  ],
                ),
                Gap(15.h),
                Row(
                  children: [
                    const Text(
                      "Name of Agency: ",
                      style: TextStyle(fontSize: 16),
                    ),
                    Expanded(
                      child: BlocBuilder<AddAgencyDropDownsBloc,
                          AddAgencyDropDownsState>(
                        builder: (context, state) {
                          return MyDropDownFormField(
                            items: nameOfAgency,
                            event: (value) =>
                                DropdownNameOfAgencyChangedEvent(value),
                          );
                        },
                      ),
                    )
                  ],
                ),
                Gap(15.h),
                MyCustomButton(
                    buttonName: 'Select Floors',
                    color: green,
                    style: const TextStyle(color: white),
                    onPressed: () {
                      final selectFloorsBloc =
                          BlocProvider.of<SelectFloorsBloc>(context);
                      context.pushNamed(
                        RoutesName.selectFloorsScreen,
                        extra: {
                          'buildingModel': widget.buildingModel,
                          'bloc': selectFloorsBloc,
                        },
                      );
                    }),
                Gap(15.h),
                MyCustomTextFormField(
                  controller: _pricePerFeetController,
                  hintText: "PricePerFeet",
                  maxLines: 1,
                  textInputType: TextInputType.number,
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
                  maxLines: 2,
                  textInputType: TextInputType.name,
                  validator: (value) {
                    return null;
                  },
                ),
                Gap(15.h),
                MyCustomButton(
                  buttonName: 'Submit',
                  color: green,
                  style: const TextStyle(color: white),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final agencyDropDown =
                          context.read<AddAgencyDropDownsBloc>().state;
                      final selectedFloors =
                          context.read<SelectFloorsBloc>().state;
                      agencies.add(PerBuildingAgencyModel(
                          workType: agencyDropDown.workTypeValue,
                          nameOfAgency: agencyDropDown.nameOfAgencyValue,
                          floors: selectedFloors.floorList,
                          pricePerFeet:
                              double.parse(_pricePerFeetController.text),
                          description: _descriptionController.text));

                      context
                          .read<PerBuildingAgenciesBloc>()
                          .add(LoadAgencies(agencies: agencies));
                      context.pop();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
