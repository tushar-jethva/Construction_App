// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/OtherExpense/payment_out_other_expense_bloc.dart';
import 'package:construction_mate/logic/controllers/PaymentInDropDownBloc/payment_in_drop_down_bloc.dart';
import 'package:construction_mate/logic/controllers/SwitchBloc/switch_bloc.dart';
import 'package:construction_mate/logic/controllers/TotalPaymentOutBloc/total_payment_out_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/custom_button_with_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/data/datasource/transaction_data_source.dart';
import 'package:construction_mate/data/repository/transaction_repository.dart';
import 'package:construction_mate/logic/controllers/PaymentOutDropDownBloc/payment_out_drop_down_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/drop_down.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:intl/intl.dart';

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
  final TextEditingController _priceOutController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();
  final formPaymentOutKey = GlobalKey<FormState>();
  final formPaymentInKey = GlobalKey<FormState>();

  final TransactionRepository transactionRepository = TransactionRepositoryImpl(
      transactionDataSource: TransactionDataSourceImpl());
  @override
  void dispose() {
    super.dispose();
    _priceInController.dispose();
    _priceOutController.dispose();
    _descriptionController.dispose();
  }

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
      context
          .read<PaymentInDropDownBloc>()
          .add(PaymentInDateChanged(date: pickedDate));
    }
  }

  void _showPaymentInDialog({required ThemeData theme}) {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: theme.scaffoldBackgroundColor,
            children: [
              Form(
                key: formPaymentInKey,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Payment In",
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      Gap(40.h),
                      BlocBuilder<PaymentInDropDownBloc,
                          PaymentInDropDownState>(
                        builder: (context, state) {
                          if (state is AgenciesLoadedInState) {
                            return PaymentOutCustomDropDown(
                              value: state.agencies[0].sId,
                              list: state.agencies
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
                                val != state.agencies[0].sId
                                    ? context.read<PaymentInDropDownBloc>().add(
                                        AgencyValueInChanged(agencyId: val!))
                                    : {};
                              },
                              // ignore: body_might_complete_normally_nullable
                              validator: (val) {
                                if (val == state.agencies[0].sId) {
                                  return 'Please select one of the names!';
                                }
                              },
                            );
                          }
                          return CustomDropDown(items: nameOfAgency);
                        },
                      ),
                      Gap(20.h),
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
                              BlocBuilder<PaymentInDropDownBloc,
                                  PaymentInDropDownState>(
                                builder: (context, state) {
                                  final String formattedDate =
                                      DateFormat.yMMMd().format(state.date);
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

                      MyCustomTextFormField(
                        controller: _priceInController,
                        hintText: "Payment In",
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
                      // Gap(15.h),
                      // MyCustomTextFormField(
                      //   controller: _descriptionController,
                      //   hintText: "Description",
                      //   maxLines: 3,
                      //   textInputType: TextInputType.name,
                      //   // ignore: body_might_complete_normally_nullable
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please enter description!';
                      //     }
                      //   },
                      // ),
                      Gap(30.h),
                      BlocListener<PaymentInDropDownBloc,
                          PaymentInDropDownState>(
                        listener: (context, state) {
                          if (state is PaymentInAddSuccess) {
                            Navigator.pop(context);
                            ReusableFunctions.showSnackBar(
                                context: context,
                                content: 'Transaction In add successfully!');
                          }
                        },
                        child: BlocBuilder<PaymentInDropDownBloc,
                            PaymentInDropDownState>(
                          builder: (context, state) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: MyCustomButtonWidget(
                                widget: state is PaymentInAddLoading
                                    ? ReusableFunctions.loader(color: white)
                                    : const Text(
                                        'PaymentIn',
                                        style: TextStyle(
                                            color: white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                color: green,
                                onPressed: () async {
                                  if (formPaymentInKey.currentState!
                                      .validate()) {
                                    context
                                        .read<PaymentInDropDownBloc>()
                                        .add(AddPaymentInTransaction(
                                          amount: _priceInController.text,
                                        ));
                                    context
                                        .read<TotalPaymentOutBloc>()
                                        .add(FetchTotalPaymentOut());

                                    _descriptionController.clear();
                                    _priceInController.clear();
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
            ],
          );
        });
  }

  void _showPaymentOutDialog({required ThemeData theme}) {
    showDialog(
        context: context,
        builder: (context) {
          return BlocProvider(
            create: (context) => SwitchBloc(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
              child: SimpleDialog(
                backgroundColor: theme.scaffoldBackgroundColor,
                children: [
                  Center(
                    child: Text(
                      "Payment Out",
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  Gap(20.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: BlocBuilder<SwitchBloc, SwitchState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Other expenses: ",
                                style: theme.textTheme.titleLarge!
                                    .copyWith(fontSize: 15),
                              ),
                              Switch(
                                value: state.isSwitched,
                                activeColor: white,
                                activeTrackColor: green,
                                inactiveTrackColor: white,
                                inactiveThumbColor: black,
                                onChanged: (val) {
                                  context
                                      .read<SwitchBloc>()
                                      .add(SwitchEvent.switched());
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  BlocBuilder<SwitchBloc, SwitchState>(
                    builder: (context, state) {
                      return !state.isSwitched
                          ? Form(
                              key: formPaymentOutKey,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0.w, vertical: 10.h),
                                child: Column(
                                  children: [
                                    BlocBuilder<PaymentOutDropDownBloc,
                                            PaymentOutDropDownState>(
                                        builder: (context, state) {
                                      if (state is ProjectsLoadingState) {
                                        return CustomDropDown(
                                            items: selectProject);
                                      }
                                      return Column(
                                        children: [
                                          PaymentOutCustomDropDown(
                                            value: state.projects[0].sId,
                                            list: state.projects
                                                .map((e) => DropdownMenuItem(
                                                      value: e.sId,
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.4, // Set a specific width here
                                                        child: Text(
                                                          e.name!,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            onChanged: (val) {
                                              val != state.projects[0].sId
                                                  ? context
                                                      .read<
                                                          PaymentOutDropDownBloc>()
                                                      .add(FetchBuildingsEvent(
                                                          val!))
                                                  : ();
                                            },
                                            // ignore: body_might_complete_normally_nullable
                                            validator: (val) {
                                              if (val ==
                                                  state.projects[0].sId) {
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
                                        if (state is BuildingsLoadingState) {
                                          return CustomDropDown(
                                              items: selectBuilding);
                                        } else if (state
                                                is BuildingsLoadedState ||
                                            state is AgenciesLoadedState) {
                                          return PaymentOutCustomDropDown(
                                            value: state.buildingValue,
                                            list: state.buildings
                                                .map((e) => DropdownMenuItem(
                                                      value: e.sId,
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.4, // Set a specific width here
                                                        child: Text(
                                                          e.name!,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            onChanged: (val) {
                                              val != state.buildings[0].sId
                                                  ? context
                                                      .read<
                                                          PaymentOutDropDownBloc>()
                                                      .add(FetchAgenciesEvent2(
                                                          val!,
                                                          state.projectValue))
                                                  : {};
                                            },
                                            // ignore: body_might_complete_normally_nullable
                                            validator: (val) {
                                              if (val ==
                                                  state.buildings[0].sId) {
                                                return 'Please select one of the names!';
                                              }
                                            },
                                          );
                                        }
                                        return CustomDropDown(
                                            items: selectBuilding);
                                      },
                                    ),
                                    Gap(15.h),
                                    BlocBuilder<PaymentOutDropDownBloc,
                                        PaymentOutDropDownState>(
                                      builder: (context, state) {
                                        if (state is AgenciesLoadedState) {
                                          return PaymentOutCustomDropDown(
                                            value: state.agencies[0].agencyId,
                                            list: state.agencies
                                                .map((e) => DropdownMenuItem(
                                                      value: e.agencyId,
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.4, // Set a specific width here
                                                        child: Text(
                                                          e.agencyName!,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            onChanged: (val) {
                                              val != state.agencies[0].agencyId
                                                  ? context
                                                      .read<
                                                          PaymentOutDropDownBloc>()
                                                      .add(AgencyValueChanged(
                                                          agencyId: val!))
                                                  : {};
                                            },
                                            // ignore: body_might_complete_normally_nullable
                                            validator: (val) {
                                              if (val ==
                                                  state.agencies[0].agencyId) {
                                                return 'Please select one of the names!';
                                              }
                                            },
                                          );
                                        }
                                        return CustomDropDown(
                                            items: nameOfAgency);
                                      },
                                    ),
                                    Gap(20.h),
                                    MyCustomTextFormField(
                                      controller: _priceOutController,
                                      hintText: "Payment OUT",
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
                                    MyCustomTextFormField(
                                      controller: _descriptionController,
                                      hintText: "Description",
                                      maxLines: 3,
                                      textInputType: TextInputType.name,
                                      // ignore: body_might_complete_normally_nullable
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter description!';
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Form(
                              key: formPaymentOutKey,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0.w, vertical: 10.h),
                                child: Column(
                                  children: [
                                    BlocBuilder<PaymentOutOtherExpenseBloc,
                                        PaymentOutOtherExpenseState>(
                                      builder: (context, state) {
                                        return PaymentOutCustomDropDown(
                                          value: otherExpenses[0],
                                          list: otherExpenses
                                              .map((e) => DropdownMenuItem(
                                                    value: e,
                                                    child: SizedBox(
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width *
                                                          0.4, // Set a specific width here
                                                      child: Text(
                                                        e,
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          onChanged: (val) {
                                            val != state.expenseValue
                                                ? context
                                                    .read<
                                                        PaymentOutOtherExpenseBloc>()
                                                    .add(PaymentOutOtherExpenseEvent
                                                        .getOtherExpenseValue(
                                                            value: val!))
                                                : {};
                                          },
                                          // ignore: body_might_complete_normally_nullable
                                          validator: (val) {
                                            if (val == state.expenseValue) {
                                              return 'Please select one of the names!';
                                            }
                                          },
                                        );
                                      },
                                    ),
                                    Gap(20.h),
                                    MyCustomTextFormField(
                                      controller: _priceOutController,
                                      hintText: "Payment OUT",
                                      maxLines: 1,
                                      textInputType: TextInputType.number,
                                      // ignore: body_might_complete_normally_nullable
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter price!';
                                        }
                                        if (double.tryParse(value) == null) {
                                          return 'Please enter valid digit!';
                                        }
                                        if (value.startsWith('-')) {
                                          return 'Please enter valid digit!';
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ));
                    },
                  ),
                  Gap(30.h),
                  BlocListener<PaymentOutDropDownBloc, PaymentOutDropDownState>(
                    listener: (context, state) {
                      if (state is PaymentOutAddSuccess) {
                        Navigator.pop(context);
                        ReusableFunctions.showSnackBar(
                            context: context,
                            content: "Payment out add successfully!");
                      } else if (state is PaymentOutAddFailure) {
                        Navigator.pop(context);
                        ReusableFunctions.showSnackBar(
                            context: context,
                            content: "Payment out not added!");
                      }
                    },
                    child: BlocBuilder<PaymentOutDropDownBloc,
                        PaymentOutDropDownState>(
                      builder: (context, state) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.0.w, vertical: 10.h),
                          child: MyCustomButtonWidget(
                            widget: state is PaymentOutAddLoading
                                ? ReusableFunctions.loader(color: white)
                                : const Text(
                                    'Payment Out',
                                    style: TextStyle(
                                        color: white,
                                        fontWeight: FontWeight.w500),
                                  ),
                            color: green,
                            onPressed: () async {
                              if (formPaymentOutKey.currentState!.validate()) {
                                context.read<PaymentOutDropDownBloc>().add(
                                    AddPaymentOutTransaction(
                                        description:
                                            _descriptionController.text,
                                        amount: _priceOutController.text));
                                context
                                    .read<TotalPaymentOutBloc>()
                                    .add(FetchTotalPaymentOut());

                                _descriptionController.clear();
                                _priceOutController.clear();
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
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 5.h),
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
                context.read<PaymentInDropDownBloc>().add(FetchAgencyInEvent());
                _showPaymentInDialog(theme: theme);
              },
            ),
            MyCustomButton(
              buttonName: "Payment Out",
              color: red,
              style: const TextStyle(
                  color: white, fontWeight: FontWeight.w500, fontSize: 15),
              onPressed: () {
                context
                    .read<PaymentOutDropDownBloc>()
                    .add(FetchProjectsEvent());

                _showPaymentOutDialog(theme: theme);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOutCustomDropDown extends StatelessWidget {
  final dynamic value;
  final List<DropdownMenuItem<dynamic>> list;
  final String? Function(dynamic val)? validator;
  final void Function(dynamic val) onChanged;
  const PaymentOutCustomDropDown({
    Key? key,
    required this.value,
    required this.list,
    this.validator,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DropdownButtonFormField(
      dropdownColor: theme.scaffoldBackgroundColor,
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
          borderSide: BorderSide(color: purple),
        ),
      ),
      value: value,
      items: list,
      onChanged: onChanged,
      validator: validator,
    );
  }
}
