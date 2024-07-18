import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/logic/controllers/AddAgencyDropDowns/add_agency_drop_downs_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentOutDropDownBloc/payment_out_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/ProjectListBloc/project_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/custom_drop_down_form_fields.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/drop_down.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/project_add_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TransactionBottomWidget extends StatefulWidget {
  const TransactionBottomWidget({
    super.key,
  });

  @override
  State<TransactionBottomWidget> createState() =>
      _TransactionBottomWidgetState();
}

class _TransactionBottomWidgetState extends State<TransactionBottomWidget> {
  final TextEditingController _priceInController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _priceInController.dispose();
  }

  openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const MyProjectAddBottomSheet();
        });
  }

  void _showPaymentInDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              BlocBuilder<ProjectBloc, ProjectState>(builder: (context, state) {
                if (state is ProjectInitial) {
                  return const CircularProgressIndicator();
                } else if (state is ProjectLoadSuccess) {
                  return state.projects.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0.w, vertical: 15.0.h),
                          child: Column(
                            children: [
                              const Center(
                                child: Text(
                                  "Payment In",
                                  style: TextStyle(
                                      color: black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Gap(40.h),
                              DropdownButtonFormField(
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(7),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      10.r,
                                    ),
                                    borderSide: const BorderSide(color: grey),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      5.r,
                                    ),
                                    borderSide: const BorderSide(color: grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      10.r,
                                    ),
                                    borderSide: const BorderSide(color: purple),
                                  ),
                                ),
                                value: state.projects[0].sId,
                                items: state.projects
                                    .map((e) => DropdownMenuItem(
                                          value: e.sId,
                                          child: Container(
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
                                onChanged: (val) {},
                                validator: (value) {
                                  // if (value == items[0].sId) {
                                  //   return 'Please select one of the names!';
                                  // }
                                },
                              ),
                              Gap(20.h),
                              MyCustomTextFormField(
                                controller: _priceInController,
                                hintText: "Payment IN",
                                maxLines: 1,
                                textInputType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter price per feet!';
                                  }
                                  if (int.tryParse(value) == null) {
                                    return 'Please enter valid digit!';
                                  }
                                  if (value.startsWith('-')) {
                                    return 'Please enter valid digit!';
                                  }
                                },
                              ),
                              Gap(30.h),
                              MyCustomButton(
                                  buttonName: "Payment IN",
                                  color: green,
                                  style: TextStyle(color: white),
                                  onPressed: () {})
                            ],
                          ),
                        )
                      : Text("No projects found!");
                } else {
                  return SizedBox();
                }
              })
            ],
          );
        });
  }

  void _showPaymentOutDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
                child: Column(
                  children: [
                    BlocBuilder<PaymentOutDropDownBloc,
                        PaymentOutDropDownState>(builder: (context, state) {
                      if (state is ProjectsLoadingState) {
                        return const Center(
                            child: const CircularProgressIndicator());
                      }
                      return Column(
                        children: [
                          const Center(
                            child: Text(
                              "Payment Out",
                              style: TextStyle(
                                  color: black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Gap(40.h),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(7),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10.r,
                                ),
                                borderSide: const BorderSide(color: grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  5.r,
                                ),
                                borderSide: const BorderSide(color: grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10.r,
                                ),
                                borderSide: const BorderSide(color: purple),
                              ),
                            ),
                            value: state.projects[0].sId,
                            items: state.projects
                                .map((e) => DropdownMenuItem(
                                      value: e.sId,
                                      child: Container(
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
                              context
                                  .read<PaymentOutDropDownBloc>()
                                  .add(FetchBuildingsEvent(val!));
                            },
                            validator: (value) {
                              if (value == state.projects[0].sId) {
                                return 'Please select one of the names!';
                              }
                            },
                          ),
                        ],
                      );
                    }),
                    Gap(15.h),
                    BlocBuilder<PaymentOutDropDownBloc,
                        PaymentOutDropDownState>(
                      builder: (context, state) {
                        print(state.buildings);
                        print(state);
                        if (state is BuildingsLoadedState) {
                          print(state.buildings[0]);
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(7),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10.r,
                                ),
                                borderSide: const BorderSide(color: grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  5.r,
                                ),
                                borderSide: const BorderSide(color: grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10.r,
                                ),
                                borderSide: const BorderSide(color: purple),
                              ),
                            ),
                            value: state.buildings[0].sId,
                            items: state.buildings
                                .map((e) => DropdownMenuItem(
                                      value: e.sId,
                                      child: Container(
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
                              context
                                  .read<PaymentOutDropDownBloc>()
                                  .add(FetchAgenciesEvent2(val!));
                            },
                            validator: (value) {
                              if (value == state.buildings[0].sId) {
                                return 'Please select one of the names!';
                              }
                            },
                          );
                        }
                        return CustomDropDown(items: selectBuilding);
                      },
                    ),
                    Gap(15.h),
                    BlocBuilder<PaymentOutDropDownBloc,
                        PaymentOutDropDownState>(
                      builder: (context, state) {
                        if (state is AgenciesLoadedState) {
                          return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(7),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10.r,
                                ),
                                borderSide: const BorderSide(color: grey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  5.r,
                                ),
                                borderSide: const BorderSide(color: grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  10.r,
                                ),
                                borderSide: const BorderSide(color: purple),
                              ),
                            ),
                            value: state.agencies[0].sId,
                            items: state.agencies
                                .map((e) => DropdownMenuItem(
                                      value: e.sId,
                                      child: Container(
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
                              // context
                              //     .read<PaymentOutDropDownBloc>()
                              //     .add(FetchAgenciesEvent2(val!));
                            },
                            validator: (value) {
                              if (value == state.buildings[0].sId) {
                                return 'Please select one of the names!';
                              }
                            },
                          );
                        }
                        return CustomDropDown(items: nameOfAgency);
                      },
                    ),
                    Gap(20.h),
                    MyCustomTextFormField(
                      controller: _priceInController,
                      hintText: "Payment OUT",
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
                    Gap(30.h),
                    MyCustomButton(
                        buttonName: "Payment Out",
                        color: green,
                        style: TextStyle(color: white),
                        onPressed: () {})
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(left: 10.w, right: 10.w),
        height: 50.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyCustomButton(
              buttonName: "Payment In",
              color: green,
              style: const TextStyle(
                  color: white, fontWeight: FontWeight.w500, fontSize: 15),
              onPressed: () {
                _showPaymentInDialog();
              },
            ),
            InkWell(
                onTap: () {
                  openBottomSheet(context: context);
                },
                child: const Icon(
                  Icons.add_circle_rounded,
                  color: Colors.deepPurple,
                  size: 30,
                )),
            MyCustomButton(
              buttonName: "Payment Out",
              color: red,
              style: const TextStyle(
                  color: white, fontWeight: FontWeight.w500, fontSize: 15),
              onPressed: () {
                context
                    .read<PaymentOutDropDownBloc>()
                    .add(FetchProjectsEvent());
                _showPaymentOutDialog();
              },
            ),
          ],
        ),
      ),
    );
  }
}
