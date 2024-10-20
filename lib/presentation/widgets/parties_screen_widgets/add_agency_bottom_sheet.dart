import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/AgencyWorkTypeSelection/agency_work_types_selection_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalAgencies/total_agencies_bloc.dart';
import 'package:construction_mate/logic/models/agency_work_type_selection_model.dart';
import 'package:construction_mate/presentation/widgets/common/custom_button_with_widget.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyAddAgencyBottomSheetParties extends StatefulWidget {
  const MyAddAgencyBottomSheetParties({super.key});

  @override
  State<MyAddAgencyBottomSheetParties> createState() =>
      _MyAddAgencyBottomSheetPartiesState();
}

class _MyAddAgencyBottomSheetPartiesState
    extends State<MyAddAgencyBottomSheetParties> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _agencyNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _workTypeAddController = TextEditingController();

  late AgencyWorkTypesSelectionBloc agencyWorksProjectsBloc;
  @override
  void initState() {
    super.initState();
    agencyWorksProjectsBloc =
        BlocProvider.of<AgencyWorkTypesSelectionBloc>(context);
    agencyWorksProjectsBloc.add(FetchWorkTypePartiesEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _agencyNameController.dispose();
    _descriptionController.dispose();
    _workTypeAddController.dispose();
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
              
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyCustomTextFormField(
                      controller: _agencyNameController,
                      hintText: 'Agency Name',
                      maxLines: 1,
                      textInputType: TextInputType.name,
                      // ignore: body_might_complete_normally_nullable
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter agency name!';
                        }
                      },
                    ),
                    Gap(15.h),
                    MyCustomTextFormField(
                      controller: _descriptionController,
                      hintText: 'Description',
                      maxLines: 3,
                      textInputType: TextInputType.name,
                      // ignore: body_might_complete_normally_nullable
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter description!';
                        }
                      },
                    ),
                    Gap(15.h),
                    BlocBuilder<AgencyWorkTypesSelectionBloc,
                            AgencyWorkTypesSelectionState>(
                        builder: ((context, state) {
                      if (state.isLoading) {
                        return ReusableFunctions.loader();
                      }
                      return Container(
                        height: 200.h,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: ListView.builder(
                            itemCount: state.agencyWorkTypeSelectedList.length,
                            itemBuilder: ((context, index) {
                              final AgencyWorkTypeSelectModel
                                  agencyWorkTypeSelectModel =
                                  state.agencyWorkTypeSelectedList[index];
                              return Row(
                                children: [
                                  Checkbox(
                                      side: const BorderSide(color: grey),
                                      value:
                                          agencyWorkTypeSelectModel.isSelected,
                                      onChanged: (val) {
                                        context
                                            .read<
                                                AgencyWorkTypesSelectionBloc>()
                                            .add(ToggleWorkTypeSelection(
                                                index: index));
                                      }),
                                  Text(agencyWorkTypeSelectModel.name!)
                                ],
                              );
                            })),
                      );
                    })),
                    Gap(15.h),
                    Row(
                      children: [
                        Expanded(
                          child: MyCustomTextFormField(
                            controller: _workTypeAddController,
                            hintText: 'Add New Work',
                            maxLines: 1,
                            textInputType: TextInputType.name,
                            // ignore: body_might_complete_normally_nullable
                            validator: (value) {},
                          ),
                        ),
                        Gap(10.w),
                        MyCustomButtonWidget(
                            widget: const Text(
                              "Add",
                              style: TextStyle(
                                  color: white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            color: green,
                            onPressed: () {
                              if (_workTypeAddController.text.isNotEmpty) {
                                context
                                    .read<AgencyWorkTypesSelectionBloc>()
                                    .add(OnAddWorkTypeButtonPressed(
                                        name: _workTypeAddController.text));
                                _workTypeAddController.clear();
                              } else {
                                ReusableFunctions.showSnackBar(
                                    context: context, content: "Add Some");
                              }
                            })
                      ],
                    ),
                    Gap(15.h),
                    BlocListener<AgencyWorkTypesSelectionBloc,
                        AgencyWorkTypesSelectionState>(
                      listener: (context, state) {
                        if (state.isAddedAgency == 2) {
                          Navigator.pop(context);
                          ReusableFunctions.showSnackBar(
                              context: context,
                              content: "Agency added successfully!");
                        }
                      },
                      child: BlocBuilder<AgencyWorkTypesSelectionBloc,
                          AgencyWorkTypesSelectionState>(
                        builder: (context, state) {
                          return MyCustomButtonWidget(
                              widget: state.isAddedAgency == 1
                                  ? ReusableFunctions.loader(color: white)
                                  : const Text(
                                      "Add Agency",
                                      style: TextStyle(
                                          color: white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                              color: green,
                              onPressed: () {
                                context
                                    .read<AgencyWorkTypesSelectionBloc>()
                                    .add(OnAddAgencyPartiesButtonPressed(
                                        name: _agencyNameController.text,
                                        description:
                                            _descriptionController.text));
                                context
                                    .read<TotalAgenciesBloc>()
                                    .add(LoadTotalAgencies());
                              });
                        },
                      ),
                    ),
                    Gap(15.h),
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
