// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/functions/reuse_functions.dart';
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

class MyTransactionScreen extends StatefulWidget {
  final ProjectModel project;
  final StartAndEndDateBloc bloc;
  const MyTransactionScreen(
      {super.key, required this.project, required this.bloc});

  @override
  State<MyTransactionScreen> createState() => _MyTransactionScreenState();
}

class _MyTransactionScreenState extends State<MyTransactionScreen> {
  final TextEditingController _searchController = TextEditingController();
  late TransactionBuildingBloc transactionBuildingBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    transactionBuildingBloc = BlocProvider.of<TransactionBuildingBloc>(context);
    transactionBuildingBloc
        .add(FetchAllTransactionByProjectId(projectId: widget.project.sId!));
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
      widget.bloc.add(DateDetailsStartChanged(startDate: pickedDate));
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
      print(pickedDate);
      widget.bloc.add(DateDetailsEndChanged(endDate: pickedDate));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  Future<void> _refreshTransactions() async {
    transactionBuildingBloc
        .add(FetchAllTransactionByProjectId(projectId: widget.project.sId!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshTransactions,
        child: BlocProvider.value(
          value: widget.bloc,
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
                          context.read<TransactionBuildingBloc>().add(
                              FetchTransactionByQuery(
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
                          child: Column(
                            children: [
                              Container(
                                height: 50.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 15.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: grey,
                                    )),
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
                                    InkWell(
                                        onTap: () {
                                          _selectStartDate(context);
                                        },
                                        child: const Icon(Icons.calendar_month))
                                  ],
                                ),
                              ),
                              Gap(15.h),
                              Container(
                                height: 50.h,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 15.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: grey,
                                    )),
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
                                        print("end in staet ${state.endDate}");
                                        return Text(
                                          "End Date: $formattedDate",
                                        );
                                      },
                                    ),
                                    InkWell(
                                        onTap: () {
                                          _selectEndDate(context);
                                        },
                                        child: const Icon(Icons.calendar_month))
                                  ],
                                ),
                              ),
                              Gap(10.h),
                              MyCustomButton(
                                  buttonName: 'Filter',
                                  color: green,
                                  style: TextStyle(color: white),
                                  onPressed: () {
                                    final state = context
                                        .read<StartAndEndDateBloc>()
                                        .state;
                                    context.read<TransactionBuildingBloc>().add(
                                        FetchTransactionsByDates(
                                            startDate: state.startDate,
                                            endDate: state.endDate));
                                    context.pop();
                                  }),
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
                                        .read<TransactionBuildingBloc>()
                                        .add(ResetAll());
                                  })
                            ],
                          )),
                    ],
                    icon: const Icon(Icons.filter_alt_outlined),
                  )
                ],
              ),
              BlocBuilder<TransactionBuildingBloc, TransactionBuildingState>(
                  builder: ((context, state) {
                if (state is TransactionBuildingLoading) {
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
                } else if (state is TransactionBuildingSuccess) {
                  return Expanded(
                    child: state.listOfTransactions.isEmpty
                        ? const Center(
                            child: Text("No transactions found!"),
                          )
                        : ListView.builder(
                            itemCount: state.listOfTransactions.length,
                            itemBuilder: (context, index) {
                              final TransactionModel transaction =
                                  state.listOfTransactions[index];
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
