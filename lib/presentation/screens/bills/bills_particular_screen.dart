import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/logic/controllers/BillingPartyParticularBloc/billing_party_particular_bloc.dart';
import 'package:construction_mate/logic/controllers/FinancialBloc/financial_bloc.dart';
import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';
import 'package:construction_mate/presentation/screens/bills/sheet_view_screen.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/bill_particular_app_bar_widget.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/bill_screen_app_bar_widet.dart';
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
        appBar: PreferredSize(
            preferredSize: Size(double.infinity,
                ReusableFunctions.getHeight(context: context, height: 0.19)),
            child: MyBillScreenParticularAppBarWidget(
              partyId: widget.party.sId!,
            )),
        body: RefreshIndicator(
          color: purple,
          onRefresh: onRefreshIndicatorCalled,
          child: BlocBuilder<BillingPartyParticularBloc,
              BillingPartyParticularState>(
            builder: (context, state) {
              if (state is BillingPartyParticularLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: purple,
                  ),
                );
              } else if (state is BillingPartyParticularLoaded) {
                return state.bills.isNotEmpty
                    ? ListView.builder(
                        itemCount: state.bills.length,
                        itemBuilder: (context, index) {
                          final bill = state.bills[index];
                          return GestureDetector(
                            onTap: () {
                              showDialogBoxBill(context, theme, bill);
                            },
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: theme.cardColor),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyRichTextForPopUp(
                                        theme: theme,
                                        leftText: "Total Amount: ",
                                        rightText: double.parse(
                                                bill.totalAmount.toString())
                                            .toStringAsFixed(2),
                                      ),
                                      MyRichTextForPopUp(
                                        theme: theme,
                                        leftText: "Receivable Amount: ",
                                        rightText: double.parse(bill
                                                .receivableAmount
                                                .toString())
                                            .toStringAsFixed(2),
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
                          );
                        })
                    : Center(
                        child: Text(
                          "No bills found!",
                          style: theme.textTheme.titleMedium,
                        ),
                      );
              } else {
                return const Center(
                  child: Text("Something went wrong!"),
                );
              }
            },
          ),
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
                color: green, borderRadius: BorderRadius.circular(12.r)),
            child: Text(
              "Sheet View",
              style: theme.textTheme.titleMedium!.copyWith(color: white),
            ),
          ),
        ));
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
                        rightText: bill.tDSAmount.toString()),
                    MyRichTextForPopUp(
                        theme: theme,
                        leftText: "sGST:  ",
                        rightText: bill.sGSTAmount.toString()),
                    MyRichTextForPopUp(
                        theme: theme,
                        leftText: "cGST:  ",
                        rightText: bill.cGSTAmount.toString()),
                    MyRichTextForPopUp(
                        theme: theme,
                        leftText: "Total Amount:  ",
                        rightText: bill.totalAmount.toString()),
                    MyRichTextForPopUp(
                        theme: theme,
                        leftText: "Net Amount:  ",
                        rightText: bill.netAmount.toString()),
                    MyRichTextForPopUp(
                        theme: theme,
                        leftText: "Receivable Amount:  ",
                        rightText: bill.receivableAmount.toString()),
                  ],
                ),
              ));
        });
  }
}

class MyRichTextForPopUp extends StatelessWidget {
  final String leftText;
  final String rightText;
  const MyRichTextForPopUp(
      {super.key,
      required this.theme,
      required this.leftText,
      required this.rightText});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: leftText,
          style: theme.textTheme.titleMedium!.copyWith(fontSize: 14)),
      TextSpan(
          text: rightText,
          style: theme.textTheme.titleMedium!
              .copyWith(fontSize: 15, fontWeight: FontWeight.bold))
    ]));
  }
}
