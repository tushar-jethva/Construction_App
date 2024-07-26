// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/TransactionByAgency/transaction_by_agency_bloc.dart';
import 'package:construction_mate/logic/models/total_agency_model.dart';
import 'package:construction_mate/presentation/widgets/common/shimmer_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/controllers/StartAndEndDateBloc/start_and_end_date_bloc.dart';
import 'package:construction_mate/logic/controllers/TransactionBuilding/transaction_building_bloc.dart';
import 'package:construction_mate/logic/models/project_model.dart';
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
    // TODO: implement initState
    super.initState();
    print("Hello dipendecies");
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
          .read<StartAndEndDateBloc>()
          .add(DateDetailsStartChanged(startDate: pickedDate));
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
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
          .read<StartAndEndDateBloc>()
          .add(DateDetailsEndChanged(endDate: pickedDate));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.agency.name!),
        surfaceTintColor: Colors.transparent,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshTransactions,
        child: BlocProvider(
          create: (context) => StartAndEndDateBloc(),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 15.h, left: 10.w, bottom: 10.h),
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
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search_rounded),
                          hintText: 'Search transactions',
                          contentPadding: EdgeInsets.symmetric(vertical: 5.h),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: grey, width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide:
                                  const BorderSide(color: grey, width: 1)),
                        ),
                      ),
                    ),
                  ),
                  PopupMenuButton<String>(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BlocBuilder<StartAndEndDateBloc,
                                          StartAndEndDateState>(
                                        builder: (context, state) {
                                          final String formattedDate =
                                              DateFormat.yMMMd()
                                                  .format(state.startDate);
                                          return Text(
                                              "Start Date: $formattedDate");
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BlocBuilder<StartAndEndDateBloc,
                                          StartAndEndDateState>(
                                        builder: (context, state) {
                                          final String formattedDate =
                                              DateFormat.yMMMd()
                                                  .format(state.endDate);
                                          return Text(
                                              "End Date: $formattedDate");
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
                                color: green,
                                style: TextStyle(color: white),
                                onPressed: () {
                                  final state =
                                      context.read<StartAndEndDateBloc>().state;
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
                                      .add(DateInitial());
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
                    icon: const Icon(Icons.filter_alt_outlined),
                  )
                ],
              ),
              BlocBuilder<TransactionByAgencyBloc, TransactionByAgencyState>(
                  builder: ((context, state) {
                if (state is TransactionByAgencyInitial) {
                  return Expanded(
                    child: Shimmer(
                        gradient: LinearGradient(
                            colors: [baseColor, highlightColor],
                            stops: const [0.1, 0.8]),
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0.w, vertical: 10.h),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                height: ReusableFunctions.getHeight(
                                    context: context, height: 0.09),
                                decoration: BoxDecoration(
                                    color: greyLight,
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const ShimmerBox(
                                            height: 10, width: 250),
                                        Gap(5.h),
                                        const ShimmerBox(
                                            height: 10, width: 160),
                                      ],
                                    ),
                                    const ShimmerBox(height: 3, width: 5),
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                  );
                } else if (state is TransactionByAgencySuccess) {
                  return Expanded(
                    child: state.listOfTransactionsAgency.isEmpty
                        ? const Center(
                            child: Text("No transactions found!"),
                          )
                        : ListView.builder(
                            itemCount: state.listOfTransactionsAgency.length,
                            itemBuilder: (context, index) {
                              final TransactionModel transaction =
                                  state.listOfTransactionsAgency[index];
                              String formattedDate =
                                  DateFormat('dd-MM-yyyy  hh:mm').format(
                                      DateTime.parse(transaction.date!));
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0.w, vertical: 10.h),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: greyLight,
                                      borderRadius:
                                          BorderRadius.circular(15.r)),
                                  child: ListTile(
                                    title: Text("${transaction.name}"),
                                    subtitle: Text(formattedDate),
                                    trailing: Text(
                                      "${transaction.amount}",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color:
                                              transaction.entryType == 'Credit'
                                                  ? green
                                                  : red),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  );
                }
                return const Text("No Transaction Found");
              }))
            ],
          ),
        ),
      ),
    );
  }
}
