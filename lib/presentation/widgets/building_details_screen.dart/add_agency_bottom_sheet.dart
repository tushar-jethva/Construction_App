import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/logic/controllers/AddAgencyDropDowns/add_agency_drop_downs_bloc.dart';
import 'package:construction_mate/logic/controllers/SelectFloorsBloc/select_floors_bloc.dart';
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pricePerFeetController.dispose();
    _descriptionController.dispose();
  }

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
                  onPressed: () {
                    final selectFloorsBloc =
                        BlocProvider.of<SelectFloorsBloc>(context);
                    print(selectFloorsBloc);
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
                  textInputType: TextInputType.number),
              Gap(15.h),
              MyCustomTextFormField(
                  controller: _descriptionController,
                  hintText: "Description",
                  maxLines: 2,
                  textInputType: TextInputType.name),
              Gap(15.h),
              MyCustomButton(
                  buttonName: 'Submit',
                  color: green,
                  style: const TextStyle(color: white),
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
