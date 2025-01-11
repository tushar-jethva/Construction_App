import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/logic/controllers/BillingPartyParticularBloc/billing_party_particular_bloc.dart';
import 'package:construction_mate/logic/controllers/FinancialBloc/financial_bloc.dart';
import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/bill_particular_app_bar_widget.dart';
import 'package:construction_mate/presentation/widgets/common/common_app_bar.dart';
import 'package:construction_mate/presentation/widgets/common/common_error_and_notfound_widget.dart';
import 'package:construction_mate/presentation/widgets/common/draggable_scrollable_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/functions/reuse_functions.dart';

class MyBillsParticularPartyScreen extends StatefulWidget {
  final BillingPartyModel party;
  const MyBillsParticularPartyScreen({super.key, required this.party});

  @override
  State<MyBillsParticularPartyScreen> createState() =>
      _MyBillsParticularPartyScreenState();
}

class _MyBillsParticularPartyScreenState
    extends State<MyBillsParticularPartyScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<BillingPartyParticularBloc>()
        .add(BillingPartyParticularLoadBills(partyId: widget.party.sId!));
  }

  String getDateFormatted({required DateTime date}) {
    String formattedDate = DateFormat.yMMMd().format(date);
    return formattedDate;
  }

  Future<void> onRefreshIndicatorCalled() async {
    context
        .read<BillingPartyParticularBloc>()
        .add(BillingPartyParticularLoadBills(partyId: widget.party.sId!));
    context.read<FinancialBloc>().add(const FinancialEvent.fetchFinancials());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: theme.cardColor,
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 60),
            child: CustomAppBar(
              title: widget.party.name ?? "",
              onTap: () {
                context.pop();
              },
            )),
        body: Stack(
          children: [
            MyBillScreenParticularAppBarWidget(
              partyId: widget.party.sId!,
            ),
            scrollableSheetWidget(context, theme)
          ],
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            context.pushNamed(RoutesName.sheetViewScreen, extra: {
              "partyId": widget.party.sId,
              "partyName": widget.party.name
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
                color: purple, borderRadius: BorderRadius.circular(12.r)),
            child: Text(
              "Sheet View",
              style: theme.textTheme.titleMedium!.copyWith(color: white),
            ),
          ),
        ));
  }

  RefreshIndicator allBillsWidget(ThemeData theme) {
    return RefreshIndicator(
      color: purple,
      onRefresh: onRefreshIndicatorCalled,
      child:
          BlocBuilder<BillingPartyParticularBloc, BillingPartyParticularState>(
        builder: (context, state) {
          if (state is BillingPartyParticularLoading) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: CircularProgressIndicator(
                  color: purple,
                ),
              ),
            );
          } else if (state is BillingPartyParticularLoaded) {
            return state.bills.isNotEmpty
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.bills.length,
                    itemBuilder: (context, index) {
                      final bill = state.bills[index];
                      return GestureDetector(
                        onTap: () {
                          showDialogBoxBill(context, theme, bill);
                        },
                        child: Card(
                          elevation: 3,
                          margin: const EdgeInsets.all(15),
                          color: theme.hintColor,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyRichTextForPopUp(
                                      theme: theme,
                                      leftText: "Total Amount:  ",
                                      rightText:
                                          "₹ ${double.parse(bill.totalAmount.toString()).toStringAsFixed(2)}",
                                    ),
                                    MyRichTextForPopUp(
                                      theme: theme,
                                      leftText: "Receivable Amount:  ",
                                      rightText:
                                          "₹ ${double.parse(bill.receivableAmount.toString()).toStringAsFixed(2)}",
                                      rightStyle: theme.textTheme.titleMedium!
                                          .copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: red),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        "Date: ${getDateFormatted(date: DateTime.parse(bill.date.toString()))}"),
                                    IconButton(
                                        onPressed: () {
                                          context.pushNamed(
                                              RoutesName.pdfPreviewScreen,
                                              extra: bill);
                                        },
                                        icon: Icon(
                                          Icons.download,
                                          color: theme.canvasColor,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })
                : const ErrorAndNotFoundWidget(text: "No bills found!");
          } else {
            return const ErrorAndNotFoundWidget(text: "Something went wrong!");
          }
        },
      ),
    );
  }

  Future<dynamic> showDialogBoxBill(
      BuildContext context, ThemeData theme, BillModel bill) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              backgroundColor: theme.scaffoldBackgroundColor,
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyRichTextForPopUp(
                        theme: theme,
                        leftText: "Date:  ",
                        rightText: getDateFormatted(
                            date: DateTime.parse(bill.date.toString()))),
                    MyRichTextForPopUp(
                        theme: theme,
                        leftText: "TDS:  ",
                        rightText: double.parse(bill.tDSAmount.toString())
                            .toStringAsFixed(2)),
                    MyRichTextForPopUp(
                        theme: theme,
                        leftText: "sGST:  ",
                        rightText: double.parse(bill.sGSTAmount.toString())
                            .toStringAsFixed(2)),
                    MyRichTextForPopUp(
                        theme: theme,
                        leftText: "cGST:  ",
                        rightText: double.parse(bill.cGSTAmount.toString())
                            .toStringAsFixed(2)),
                    MyRichTextForPopUp(
                        theme: theme,
                        leftText: "Total Amount:  ",
                        rightText: double.parse(bill.totalAmount.toString())
                            .toStringAsFixed(2)),
                    MyRichTextForPopUp(
                        theme: theme,
                        leftText: "Net Amount:  ",
                        rightText: double.parse(bill.netAmount.toString())
                            .toStringAsFixed(2)),
                    MyRichTextForPopUp(
                        theme: theme,
                        leftText: "Receivable Amount:  ",
                        rightText:
                            double.parse(bill.receivableAmount.toString())
                                .toStringAsFixed(2)),
                  ],
                ),
              ));
        });
  }

  DraggableScrollableSheetCommonComp scrollableSheetWidget(
      BuildContext context, ThemeData theme) {
    return DraggableScrollableSheetCommonComp(
      draggableScrollableController: DraggableScrollableController(),
      stops: const [0.75, 0.98],
      initialSize: 0.75,
      minChildSize: 0.75,
      radius: 20,
      isDraggerShow: false,
      newWidget: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                    controller: scrollController, child: allBillsWidget(theme)),
              )
            ],
          ),
        );
      },
    );
  }
}

class MyRichTextForPopUp extends StatelessWidget {
  final String leftText;
  final String rightText;
  final TextStyle? rightStyle;
  const MyRichTextForPopUp(
      {super.key,
      required this.theme,
      required this.leftText,
      required this.rightText,
      this.rightStyle});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: leftText,
          style:
              theme.textTheme.titleMedium!.copyWith(fontSize: 14, color: grey)),
      TextSpan(
          text: rightText,
          style: rightStyle ??
              theme.textTheme.titleMedium!
                  .copyWith(fontSize: 15, fontWeight: FontWeight.bold))
    ]));
  }
}
