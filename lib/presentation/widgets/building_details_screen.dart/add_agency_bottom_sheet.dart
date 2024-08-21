import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/data/datasource/agency_data_source.dart';
import 'package:construction_mate/data/datasource/work_types_source.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/work_type_repository.dart';
import 'package:construction_mate/logic/controllers/AddAgencyDropDowns/add_agency_drop_downs_bloc.dart';
import 'package:construction_mate/logic/controllers/PerBuildingAgency/per_building_agencies_bloc.dart';
import 'package:construction_mate/logic/controllers/SelectFloorsBloc/select_floors_bloc.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/logic/models/work_type_model.dart';
import 'package:construction_mate/presentation/widgets/common/custom_button_with_widget.dart';
import 'package:construction_mate/presentation/widgets/common/custom_drop_down_agency.dart';
import 'package:construction_mate/presentation/widgets/common/custom_drop_down_form_fields.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/drop_down.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../logic/models/building_model.dart';

class MyAddAgencyBottomSheet extends StatefulWidget {
  final BuildingModel buildingModel;
  final ProjectModel projectModel;
  const MyAddAgencyBottomSheet(
      {super.key, required this.buildingModel, required this.projectModel});

  @override
  State<MyAddAgencyBottomSheet> createState() => _MyAddAgencyBottomSheetState();
}

class _MyAddAgencyBottomSheetState extends State<MyAddAgencyBottomSheet> {
  final TextEditingController _pricePerFeetController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _pricePerFeetController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddAgencyDropDownsBloc(
          agencyRepository: AgencyRepositoryImpl(
            agencyDataSource: AgencyDataSourceDataSourceImpl(),
          ),
          workTypesRepository:
              WorkTypesRepositoryImpl(WorkTypesDataSourceImpl()))
        ..add(FetchWorkTypesEvent()),
      child: _AddAgencyBottomSheetForm(
        buildingModel: widget.buildingModel,
        projectModel: widget.projectModel,
        formKey: _formKey,
        pricePerFeetController: _pricePerFeetController,
        descriptionController: _descriptionController,
      ),
    );
  }
}

class _AddAgencyBottomSheetForm extends StatelessWidget {
  _AddAgencyBottomSheetForm({
    required this.buildingModel,
    required this.projectModel,
    required this.formKey,
    required this.pricePerFeetController,
    required this.descriptionController,
  });

  final BuildingModel buildingModel;
  final ProjectModel projectModel;
  final GlobalKey<FormState> formKey;
  final TextEditingController pricePerFeetController;
  final TextEditingController descriptionController;

  final AgencyRepository agencyRepository =
      AgencyRepositoryImpl(agencyDataSource: AgencyDataSourceDataSourceImpl());

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final theme = Theme.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r)),
            color: theme.scaffoldBackgroundColor,
          ),
          child: Form(
            key: formKey,
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
                    Text(
                      "Work Type: ",
                      style:
                          theme.textTheme.titleLarge!.copyWith(fontSize: 16.5),
                    ),
                    Expanded(
                      child: BlocBuilder<AddAgencyDropDownsBloc,
                          AddAgencyDropDownsState>(
                        builder: (context, state) {
                          final workTypes = state.workTypes
                              .where((e) => e.name != 'Builder')
                              .toList();
                          if (state is WorkTypeLoadingState) {
                            return CustomDropDown(items: workType);
                          }

                          return MyDropDownFormField(
                            items: state.workTypes.isNotEmpty
                                ? workTypes
                                : workType
                                    .map(
                                        (e) => WorkTypeModel(name: e, sId: "1"))
                                    .toList(),
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
                    Text(
                      "Name of Agency: ",
                      style:
                          theme.textTheme.titleLarge!.copyWith(fontSize: 16.5),
                    ),
                    Expanded(
                      child: BlocBuilder<AddAgencyDropDownsBloc,
                          AddAgencyDropDownsState>(
                        builder: (context, state) {
                          if (state is AgencyLoadedState) {
                            return MyDropDownFormFieldAgency(
                              items: state.agencies,
                              event: (value) =>
                                  DropdownNameOfAgencyChangedEvent(value),
                            );
                          }
                          return CustomDropDown(items: nameOfAgency);
                        },
                      ),
                    )
                  ],
                ),
                Gap(15.h),
                MyCustomTextFormField(
                  controller: pricePerFeetController,
                  hintText: "PricePerFeet",
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
                MyCustomButton(
                  buttonName: 'Select Floors',
                  color: green,
                  style: const TextStyle(color: white),
                  onPressed: () {
                    for (int i = 0; i < 1; i++) {
                      if (formKey.currentState!.validate()) {
                        final dropDown =
                            context.read<AddAgencyDropDownsBloc>().state;

                        if (dropDown.workTypeValue.isNotEmpty) {
                          final selectFloorsBloc =
                              BlocProvider.of<SelectFloorsBloc>(context);
                          context.pushNamed(
                            RoutesName.selectFloorsScreen,
                            extra: {
                              'buildingModel': buildingModel,
                              'bloc': selectFloorsBloc,
                              'projectModel': projectModel,
                              'workTypeId': dropDown.workTypeValue
                            },
                          );
                        }
                      }
                    }
                  },
                ),
                Gap(15.h),
                MyCustomTextFormField(
                  controller: descriptionController,
                  hintText: "Description",
                  maxLines: 2,
                  textInputType: TextInputType.name,
                  validator: (value) {
                    return null;
                  },
                ),
                Gap(15.h),
                BlocListener<AddAgencyDropDownsBloc, AddAgencyDropDownsState>(
                  listener: (context, state) {
                    if (state is AddAgencySuccessState) {
                      Navigator.pop(context);
                      ReusableFunctions.showSnackBar(
                          context: context,
                          content: "Agency added successfully!");
                      context.read<PerBuildingAgenciesBloc>().add(LoadAgencies(
                          buildingId: buildingModel.sId!,
                          projectId: projectModel.sId!));
                    }
                  },
                  child: BlocBuilder<AddAgencyDropDownsBloc,
                      AddAgencyDropDownsState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: MyCustomButtonWidget(
                          widget: state is AddAgencyLoadingState
                              ? ReusableFunctions.loader(color: white)
                              : const Text(
                                  'Add Agency',
                                  style: TextStyle(color: white),
                                ),
                          color: green,
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              final selectedFloors =
                                  context.read<SelectFloorsBloc>().state;

                              context.read<AddAgencyDropDownsBloc>().add(
                                  AddAgencyOfDropDownEvent(
                                      floors: selectedFloors.floorList,
                                      buildingId: buildingModel.sId!,
                                      projectId: projectModel.sId!,
                                      description: descriptionController.text,
                                      pricePerFeet: double.parse(
                                          pricePerFeetController.text)));
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
    );
  }
}
