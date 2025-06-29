import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/data/datasource/agency_data_source.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/data/repository/bills_repository.dart';
import 'package:construction_mate/logic/controllers/AddBillBloc/add_bill_bloc.dart';
import 'package:construction_mate/logic/controllers/BillingPartyParticularBloc/billing_party_particular_bloc.dart';
import 'package:construction_mate/logic/controllers/FinancialBloc/financial_bloc.dart';
import 'package:construction_mate/logic/controllers/SwitchBloc/switch_bloc.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';
import 'package:construction_mate/presentation/screens/project/project_screen.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/add_bill_bottom_sheet.dart';
import 'package:construction_mate/presentation/widgets/BillScreenWidgets/bill_particular_app_bar_widget.dart';
import 'package:construction_mate/presentation/widgets/common/common_app_bar.dart';
import 'package:construction_mate/presentation/widgets/common/common_error_and_notfound_widget.dart';
import 'package:construction_mate/presentation/widgets/common/draggable_scrollable_sheet.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class MyBillsParticularPartyScreen extends StatefulWidget {
  final AgencyModel party;
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

  openBottomSheetOfBill({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        showDragHandle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        context: context,
        builder: (context) {
          context.read<AddBillBloc>().add(AddBillInitialize());
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SwitchBloc(),
              ),
            ],
            child: MyAddBillBottomSheet(
              partyId: widget.party.sId ?? '',
              partyName: widget.party.name ?? '',
            ),
          );
        });
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
              partyId: widget.party.sId ?? '',
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
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
                color: purple, borderRadius: BorderRadius.circular(12.r)),
            child: Text(
              "Sheet View",
              style: theme.textTheme.titleMedium!.copyWith(color: white),
            ),
          ),
        ));
  }

  RefreshIndicator allBillsWidget(
      ThemeData theme, ScrollController scrollController) {
    return RefreshIndicator(
      color: purple,
      onRefresh: onRefreshIndicatorCalled,
      child:
          BlocBuilder<BillingPartyParticularBloc, BillingPartyParticularState>(
        builder: (context, state) {
          if (state is BillingPartyParticularLoading) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Center(
                child: CircularProgressIndicator(
                  color: purple,
                ),
              ),
            );
          } else if (state is BillingPartyParticularLoaded) {
            return state.bills.isNotEmpty
                ? ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    controller: scrollController,
                    // shrinkWrap: true,
                    itemCount: state.bills.length,
                    itemBuilder: (context, index) {
                      final bill = state.bills[index];
                      return GestureDetector(
                        onTap: () {
                          showDialogBoxBill(context, theme, bill);
                        },
                        child: Card(
                          elevation: 3,
                          margin: EdgeInsets.all(15.r),
                          color: theme.hintColor,
                          child: Padding(
                            padding: EdgeInsets.all(16.r),
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
                                          "₹ ${ReusableFunctions.formatNumber(bill.totalAmount)}",
                                    ),
                                    MyRichTextForPopUp(
                                      theme: theme,
                                      leftText: "Receivable Amount:  ",
                                      rightText:
                                          "₹ ${ReusableFunctions.formatNumber(bill.receivableAmount)}",
                                      rightStyle: theme.textTheme.titleMedium!
                                          .copyWith(
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: red),
                                    ),
                                    Text(
                                      "Date: ${getDateFormatted(date: DateTime.parse(bill.date.toString()))}",
                                      style: theme.textTheme.labelLarge
                                          ?.copyWith(fontSize: 12.sp),
                                    ),
                                  ],
                                ),
                                10.wx,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
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
                    // Assume you have access to 'theme' and 'bill' object

// Import your number formatter (if you haven't already)
// import 'package:construction_mate/utilities/number_formatter.dart';

// Import your date formatter (if you have one)
// import 'package:construction_mate/utilities/date_formatter.dart'; // Assuming getDateFormatted is here

// Use it like this:
                    MyRichTextForPopUp(
                      theme: theme,
                      leftText: "Date: ", // Consistent trailing space
                      rightText: getDateFormatted(
                          date: DateTime.parse(bill.date.toString())),
                      // No specific rightStyle needed here, default bold is fine
                    ),
                    MyRichTextForPopUp(
                      theme: theme,
                      leftText: "TDS: ",
                      rightText: ReusableFunctions.formatNumber(
                          bill.tDSAmount), // Use your flexible formatter
                    ),
                    MyRichTextForPopUp(
                      theme: theme,
                      leftText: "SGST: ",
                      rightText: ReusableFunctions.formatNumber(
                          bill.sGSTAmount), // Use your flexible formatter
                    ),
                    MyRichTextForPopUp(
                      theme: theme,
                      leftText: "CGST: ",
                      rightText: ReusableFunctions.formatNumber(
                          bill.cGSTAmount), // Use your flexible formatter
                    ),
// Emphasize important amounts with specific colors and potentially a larger font
                    MyRichTextForPopUp(
                      theme: theme,
                      leftText: "Total Amount: ",
                      rightText: ReusableFunctions.formatNumber(
                          bill.totalAmount), // Use your flexible formatter
                      valueColor:
                          Colors.deepPurple, // Example: Highlight Total Amount
                      rightStyle: theme.textTheme.titleMedium!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900), // Bolder, larger
                    ),
                    MyRichTextForPopUp(
                      theme: theme,
                      leftText: "Net Amount: ",
                      rightText: ReusableFunctions.formatNumber(
                          bill.netAmount), // Use your flexible formatter
                      valueColor: Colors.blue, // Example: Highlight Net Amount
                      rightStyle: theme.textTheme.titleMedium!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900), // Bolder, larger
                    ),
                    MyRichTextForPopUp(
                      theme: theme,
                      leftText: "Receivable Amount: ",
                      rightText: ReusableFunctions.formatNumber(
                          bill.receivableAmount), // Use your flexible formatter
                      valueColor:
                          Colors.red, // Example: Highlight Receivable Amount
                      rightStyle: theme.textTheme.titleMedium!.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900), // Bolder, larger
                    ),
                    // MyRichTextForPopUp(
                    //     theme: theme,
                    //     leftText: "Date:  ",
                    //     rightText: getDateFormatted(
                    //         date: DateTime.parse(bill.date.toString()))),
                    // MyRichTextForPopUp(
                    //     theme: theme,
                    //     leftText: "TDS:  ",
                    //     rightText: double.parse(bill.tDSAmount.toString())
                    //         .toStringAsFixed(2)),
                    // MyRichTextForPopUp(
                    //     theme: theme,
                    //     leftText: "sGST:  ",
                    //     rightText: double.parse(bill.sGSTAmount.toString())
                    //         .toStringAsFixed(2)),
                    // MyRichTextForPopUp(
                    //     theme: theme,
                    //     leftText: "cGST:  ",
                    //     rightText: double.parse(bill.cGSTAmount.toString())
                    //         .toStringAsFixed(2)),
                    // MyRichTextForPopUp(
                    //     theme: theme,
                    //     leftText: "Total Amount:  ",
                    //     rightText: double.parse(bill.totalAmount.toString())
                    //         .toStringAsFixed(2)),
                    // MyRichTextForPopUp(
                    //     theme: theme,
                    //     leftText: "Net Amount:  ",
                    //     rightText: double.parse(bill.netAmount.toString())
                    //         .toStringAsFixed(2)),
                    // MyRichTextForPopUp(
                    //     theme: theme,
                    //     leftText: "Receivable Amount:  ",
                    //     rightText:
                    //         double.parse(bill.receivableAmount.toString())
                    //             .toStringAsFixed(2)),
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
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 16.h),
                  child: CommonButton2(
                    buttonName: "Add Bill",
                    onTap: () {
                      openBottomSheetOfBill(context: context);
                    },
                  ),
                ),
              ),
              Expanded(child: allBillsWidget(theme, scrollController)),
            ],
          ),
        );
      },
    );
  }
}

// Assuming 'grey' and other colors are defined in your constants file
// import 'package:construction_mate/core/constants/colors.dart';

class MyRichTextForPopUp extends StatelessWidget {
  final String leftText;
  final String rightText;
  final TextStyle? rightStyle;
  final Color? valueColor; // New: Optional color for the right text

  const MyRichTextForPopUp({
    super.key,
    required this.theme,
    required this.leftText,
    required this.rightText,
    this.rightStyle,
    this.valueColor, // Initialize the new property
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Add padding for better spacing between rows
      padding: EdgeInsets.symmetric(vertical: 4.0), // Adjust as needed
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: leftText,
              style: theme.textTheme.titleMedium!.copyWith(
                fontSize: 14.sp,
                color: theme.textTheme.titleMedium!.color
                    ?.withOpacity(0.7), // Slightly muted label color
                // You might use a specific grey here if 'grey' is not part of your theme directly
                // color: grey, // If grey is a constant color
              ),
            ),
            TextSpan(
              text: rightText,
              style: rightStyle ??
                  theme.textTheme.titleMedium!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold, // Keep bold for values
                    color: valueColor ??
                        theme.textTheme.titleMedium!
                            .color, // Use custom color or default text color
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
