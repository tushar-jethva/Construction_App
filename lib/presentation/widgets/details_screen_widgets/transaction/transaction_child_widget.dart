import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/StartAndEndDateBloc/start_and_end_date_bloc.dart';
import 'package:construction_mate/logic/controllers/TransactionBuilding/transaction_building_bloc.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TransactionChildWidget extends StatelessWidget {
  TransactionChildWidget({super.key});

  final TextEditingController _searchController = TextEditingController();

  Future<void> _selectStartDate(BuildContext context) async {
    ReusableFunctions.showDatePicker(
        context: context,
        lastDate: DateTime(2050),
        onDateSelected: (date) {
          context
              .read<StartAndEndDateBloc>()
              .add(StartAndEndDateEvent.onStartDateChanged(startDate: date));
        });
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime startDate =
        context.read<StartAndEndDateBloc>().state.startDate;
    ReusableFunctions.showDatePicker(
        context: context,
        lastDate: DateTime(2050),
        firstDate: startDate,
        onDateSelected: (date) {
          context
              .read<StartAndEndDateBloc>()
              .add(StartAndEndDateEvent.onEndDateChanged(
                endDate: date,
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 15.h, left: 10.w, bottom: 10.h),
            child: TextField(
              controller: _searchController,
              maxLines: 1,
              onChanged: (value) {
                context.read<TransactionBuildingBloc>().add(
                    FetchTransactionByQuery(query: _searchController.text));
              },
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              style: theme.textTheme.titleMedium,
              decoration: InputDecoration(
                filled: true,
                fillColor: theme.scaffoldBackgroundColor,
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: grey,
                ),
                hintText: 'Search transactions',
                hintStyle: theme.textTheme.titleMedium!.copyWith(color: grey),
                contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: grey, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: transparent, width: 1)),
              ),
            ),
          ),
        ),
        PopupMenuButton<String>(
          color: white,
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onSelected: (String value) {},
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<String>(
              value: 'Option 1',
              child: Column(
                children: [
                  10.hx,
                  GestureDetector(
                    onTap: () {
                      _selectStartDate(context);
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
                          BlocBuilder<StartAndEndDateBloc,
                              StartAndEndDateState>(
                            builder: (context, state) {
                              final String formattedDate =
                                  DateFormat.yMMMd().format(state.startDate);
                              return Text("Start Date: $formattedDate");
                            },
                          ),
                          const Icon(Icons.calendar_month),
                        ],
                      ),
                    ),
                  ),
                  Gap(15.h),
                  GestureDetector(
                    onTap: () {
                      _selectEndDate(context);
                    },
                    child: Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 15.h),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: grey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocBuilder<StartAndEndDateBloc,
                              StartAndEndDateState>(
                            builder: (context, state) {
                              final String formattedDate =
                                  DateFormat.yMMMd().format(state.endDate);
                              return Text("End Date: $formattedDate");
                            },
                          ),
                          const Icon(Icons.calendar_month),
                        ],
                      ),
                    ),
                  ),
                  Gap(10.h),
                  MyCustomButton(
                    buttonName: 'Filter',
                    color: purple,
                    style: const TextStyle(color: white),
                    onPressed: () {
                      final state = context.read<StartAndEndDateBloc>().state;
                      context.read<TransactionBuildingBloc>().add(
                            FetchTransactionsByDates(
                              startDate: state.startDate,
                              endDate: state.endDate,
                            ),
                          );
                      context.pop();
                    },
                  ),
                  Gap(10.h),
                  MyCustomButton(
                    buttonName: 'Reset',
                    color: greyLight,
                    style: const TextStyle(color: black),
                    onPressed: () {
                      context
                          .read<StartAndEndDateBloc>()
                          .add(const StartAndEndDateEvent.initalize());
                      context.read<TransactionBuildingBloc>().add(ResetAll());
                    },
                  ),
                  10.hx
                ],
              ),
            ),
          ],
          icon: Icon(
            Icons.filter_alt_outlined,
            color: theme.canvasColor,
          ),
        )
      ],
    );
  }
}
