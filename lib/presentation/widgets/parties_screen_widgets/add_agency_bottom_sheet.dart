import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/controllers/AgencyWorkTypeSelection/agency_work_types_selection_bloc.dart';
import 'package:construction_mate/logic/controllers/AgencyWorkingInProject/agency_works_projects_bloc.dart';
import 'package:construction_mate/logic/models/agency_work_type_selection_model.dart';
import 'package:construction_mate/presentation/widgets/common/custom_button_with_widget.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    // TODO: implement initState
    super.initState();
    agencyWorksProjectsBloc =
        BlocProvider.of<AgencyWorkTypesSelectionBloc>(context);
    agencyWorksProjectsBloc.add(FetchWorkTypePartiesEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _agencyNameController.dispose();
    _descriptionController.dispose();
    _workTypeAddController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Padding(
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r))),
          child: Column(
            children: [
              Container(
                height: 7.w,
                width: 50.w,
                margin: EdgeInsets.symmetric(vertical: 15.h),
                decoration: BoxDecoration(
                    color: grey, borderRadius: BorderRadius.circular(8)),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyCustomTextFormField(
                      controller: _agencyNameController,
                      hintText: 'Agency Name',
                      maxLines: 1,
                      textInputType: TextInputType.name,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter description!';
                        }
                      },
                    ),
                    Gap(15.h),
                    Row(
                      children: [
                        Expanded(
                          child: MyCustomTextFormField(
                            controller: _workTypeAddController,
                            hintText: 'Add New Work',
                            maxLines: 1,
                            textInputType: TextInputType.name,
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
                              context
                              .read<AgencyWorkTypesSelectionBloc>()
                              .add(OnAddWorkTypeButtonPressed(name: _workTypeAddController.text));
                            })
                      ],
                    ),
                    Gap(15.h),
                    BlocBuilder<AgencyWorkTypesSelectionBloc,
                            AgencyWorkTypesSelectionState>(
                        builder: ((context, state) {
                      if (state.isLoading) {
                        return const CircularProgressIndicator();
                      }
                      return SizedBox(
                        height: 200.h,
                        child: ListView.builder(
                            itemCount: state.agencyWorkTypeSelectedList.length,
                            itemBuilder: ((context, index) {
                              final AgencyWorkTypeSelectModel
                                  agencyWorkTypeSelectModel =
                                  state.agencyWorkTypeSelectedList[index];
                              return Row(
                                children: [
                                  Checkbox(
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
                    MyCustomButtonWidget(
                        widget: const Text(
                          "Add Agency",
                          style: TextStyle(
                              color: white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        color: green,
                        onPressed: () {
                          
                        }),
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
