// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/controllers/TransactionBuilding/transaction_building_bloc.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:construction_mate/logic/models/transaction_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyTransactionScreen extends StatefulWidget {
  final ProjectModel project;
  final ScrollController scrollController;
  const MyTransactionScreen(
      {super.key, required this.project, required this.scrollController});

  @override
  State<MyTransactionScreen> createState() => _MyTransactionScreenState();
}

class _MyTransactionScreenState extends State<MyTransactionScreen> {
  final TextEditingController _searchController = TextEditingController();
  late TransactionBuildingBloc transactionBuildingBloc;

  @override
  void initState() {
    super.initState();
    transactionBuildingBloc = BlocProvider.of<TransactionBuildingBloc>(context);
    transactionBuildingBloc
        .add(FetchAllTransactionByProjectId(projectId: widget.project.sId!));
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  Future<void> _refreshTransactions() async {
    _searchController.text.isEmpty
        ? transactionBuildingBloc
            .add(FetchAllTransactionByProjectId(projectId: widget.project.sId!))
        : transactionBuildingBloc
            .add(FetchTransactionByQuery(query: _searchController.text));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RefreshIndicator(
      color: purple,
      onRefresh: _refreshTransactions,
      child: BlocBuilder<TransactionBuildingBloc, TransactionBuildingState>(
          builder: ((context, state) {
        if (state is TransactionBuildingLoading) {
          return Skeletonizer(
              enabled: true,
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return transactionWidget(
                      context,
                      TransactionModel(
                        sId: "#8098809812",
                        amount: "1000",
                        isCompleted: false,
                      ),
                      theme,
                      "");
                },
              ));
        } else if (state is TransactionBuildingSuccess) {
          return state.listOfTransactions.isEmpty
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView(children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: const Center(
                            child: Text("No transactions founds!"))),
                  ]),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 0.73,
                  child: ListView.builder(
                    controller: widget.scrollController,
                    itemCount: state.listOfTransactions.length,
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final TransactionModel transaction =
                          state.listOfTransactions[index];
                      String formattedDate = DateFormat('dd-MM-yyyy  hh:mm')
                          .format(DateTime.parse(transaction.date!));

                      String formattedDate2 = DateFormat('dd-MM-yyyy')
                          .format(DateTime.parse(transaction.date!));
                      return transactionWidget(
                          context,
                          transaction,
                          theme,
                          transaction.entryType == 'Credit'
                              ? formattedDate2
                              : formattedDate);
                    },
                  ),
                );
        }
        return const Text("No Transaction Found");
      })),
    );
  }

  GestureDetector transactionWidget(BuildContext context,
      TransactionModel transaction, ThemeData theme, String formattedDate) {
    return GestureDetector(
      onTap: () {
        showTopSnackBar(context, transaction.description ?? "",
            messageType: MessageType.done);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  Text(
                    "${transaction.name}",
                    style: theme.textTheme.titleMedium,
                  ),
                  Gap(5.w),
                  transaction.isCompleted!
                      ? Icon(
                          Icons.check_circle_outline_outlined,
                          color: orange,
                          size: 20,
                        )
                      : const SizedBox()
                ],
              ),
              subtitle: Text(
                formattedDate,
                style: theme.textTheme.titleMedium!
                    .copyWith(color: grey, fontSize: 12),
              ),
              trailing: Text(
                "₹ ${transaction.amount}",
                style: theme.textTheme.titleLarge?.copyWith(
                    fontSize: 14,
                    color: (transaction.isCompleted ?? false)
                        ? orange
                        : transaction.entryType == 'Credit'
                            ? green
                            : red),
              ),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
