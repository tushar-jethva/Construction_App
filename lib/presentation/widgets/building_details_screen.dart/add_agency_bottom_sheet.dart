import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/logic/controllers/AddAgencyDropDowns/add_agency_drop_downs_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/custom_drop_down_form_fields.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../logic/models/building_model.dart';

class MyAddAgencyBottomSheet extends StatelessWidget {
  final BuildingModel buildingModel;

  const MyAddAgencyBottomSheet({super.key, required this.buildingModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Work Type: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Expanded(
                    child: BlocBuilder<AddAgencyDropDownsBloc,
                        AddAgencyDropDownsState>(
                      builder: (context, state) {
                        return MyDropDownFormField(
                          items: workType,
                          event: (value) => DropdownWorkTypeChangedEvent(value),
                        );
                      },
                    ),
                  )
                ],
              ),
              Gap(15.h),
              Row(
                children: [
                  Text(
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
                  style: TextStyle(color: white),
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
