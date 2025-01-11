// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/TransactionByAgency/transaction_by_agency_bloc.dart';
import 'package:construction_mate/logic/models/total_agency_model.dart';
import 'package:construction_mate/presentation/widgets/common/common_error_and_notfound_widget.dart';
import 'package:construction_mate/presentation/widgets/common/draggable_scrollable_sheet.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/controllers/StartAndEndDateBloc/start_and_end_date_bloc.dart';
import 'package:construction_mate/logic/models/transaction_model.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:shimmer/shimmer.dart';

class MyTransactionPartiesScreen extends StatefulWidget {
  final TotalAgencyModel agency;
  const MyTransactionPartiesScreen({super.key, required this.agency});

  @override
  State<MyTransactionPartiesScreen> createState() =>
      _MyTransactionPartiesScreenState();
}

class _MyTransactionPartiesScreenState
    extends State<MyTransactionPartiesScreen> {
  final TextEditingController _searchController = TextEditingController();
  late TransactionByAgencyBloc transactionByAgencyBloc;

  @override
  void initState() {
    super.initState();
    super.didChangeDependencies();
    transactionByAgencyBloc = BlocProvider.of<TransactionByAgencyBloc>(context);
    transactionByAgencyBloc
        .add(FetchAllTransactionByAgencyId(agencyId: widget.agency.sId!));
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  Future<void> _refreshTransactions() async {
    _searchController.text.isEmpty
        ? transactionByAgencyBloc
            .add(FetchAllTransactionByAgencyId(agencyId: widget.agency.sId!))
        : transactionByAgencyBloc
            .add(FetchTransactionByQueryParties(query: _searchController.text));
  }

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
    return Scaffold(
      backgroundColor: theme.cardColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: theme.canvasColor),
        title: Text(
          widget.agency.name!,
          style: theme.textTheme.titleLarge,
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          searchAndFilterWidget(context, theme),
          scrollableSheetWidget(context, theme)
        ],
      ),
    );
  }

  BlocBuilder<TransactionByAgencyBloc, TransactionByAgencyState>
      allTransactions(ThemeData theme) {
    return BlocBuilder<TransactionByAgencyBloc, TransactionByAgencyState>(
        builder: ((context, state) {
      if (state is TransactionByAgencyInitial) {
        return Shimmer(
            gradient: LinearGradient(
                colors: [theme.hoverColor, theme.cardColor],
                stops: const [0.1, 0.8]),
            child: ListView.builder(
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.h),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    height: ReusableFunctions.getHeight(
                        context: context, height: 0.09),
                    decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const ShimmerBox(height: 10, width: 250),
                            Gap(5.h),
                            const ShimmerBox(height: 10, width: 160),
                          ],
                        ),
                        const ShimmerBox(height: 3, width: 5),
                      ],
                    ),
                  ),
                );
              },
            ));
      } else if (state is TransactionByAgencySuccess) {
        return state.listOfTransactionsAgency.isEmpty
            ? const ErrorAndNotFoundWidget(text: "No transactions found!")
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.listOfTransactionsAgency.length,
                itemBuilder: (context, index) {
                  final TransactionModel transaction =
                      state.listOfTransactionsAgency[index];
                  String formattedDate = DateFormat('dd-MM-yyyy  hh:mm')
                      .format(DateTime.parse(transaction.date!));
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "${transaction.description}",
                            style: theme.textTheme.titleMedium,
                          ),
                          subtitle: Text(
                            formattedDate,
                            style: theme.textTheme.titleMedium!
                                .copyWith(color: grey, fontSize: 14),
                          ),
                          trailing: Text(
                            "₹ ${transaction.amount}",
                            style: theme.textTheme.titleLarge?.copyWith(
                                fontSize: 14,
                                color: transaction.entryType == 'Credit'
                                    ? green
                                    : red),
                          ),
                        ),
                        const Divider()
                      ],
                    ),
                  );
                },
              );
      }
      return const ErrorAndNotFoundWidget(text: "No transactions found!");
    }));
  }

  Row searchAndFilterWidget(BuildContext context, ThemeData theme) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 15.h, left: 10.w, bottom: 10.h),
            child: TextField(
              controller: _searchController,
              maxLines: 1,
              onChanged: (value) {
                context.read<TransactionByAgencyBloc>().add(
                    FetchTransactionByQueryParties(
                        query: _searchController.text));
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
          color: theme.scaffoldBackgroundColor,
          onSelected: (String value) {},
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<String>(
              value: 'Option 1',
              child: BlocProvider.value(
                value: BlocProvider.of<StartAndEndDateBloc>(context),
                child: Column(
                  children: [
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
                        context.read<TransactionByAgencyBloc>().add(
                              FetchTransactionsByDatesParties(
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
                        context
                            .read<TransactionByAgencyBloc>()
                            .add(ResetAllPartiesDate());
                      },
                    ),
                  ],
                ),
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

  DraggableScrollableSheetCommonComp scrollableSheetWidget(
      BuildContext context, ThemeData theme) {
    return DraggableScrollableSheetCommonComp(
      draggableScrollableController: DraggableScrollableController(),
      stops: const [0.9, 0.98],
      initialSize: 0.9,
      minChildSize: 0.9,
      radius: 20,
      isDraggerShow: false,
      widget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            RefreshIndicator(
                onRefresh: _refreshTransactions, child: allTransactions(theme))
          ],
        ),
      ),
    );
  }
}
