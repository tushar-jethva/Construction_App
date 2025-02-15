import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/pdf/pdf_generate.dart';
import 'package:construction_mate/logic/controllers/BillingPartyParticularBloc/billing_party_particular_bloc.dart';
import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class MySheetViewScreen extends StatefulWidget {
  final String partyId;
  final String partyName;
  const MySheetViewScreen(
      {super.key, required this.partyId, required this.partyName});

  @override
  State<MySheetViewScreen> createState() => _MySheetViewScreenState();
}

class _MySheetViewScreenState extends State<MySheetViewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<BillingPartyParticularBloc>()
        .add(BillingPartyParticularLoadBills(partyId: widget.partyId));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: theme.canvasColor),
        title: Text(
          widget.partyName,
          style: theme.textTheme.titleLarge,
        ),
      ),
      body:
          BlocBuilder<BillingPartyParticularBloc, BillingPartyParticularState>(
        builder: (context, state) {
          if (state is BillingPartyParticularLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: purple,
              ),
            );
          } else if (state is BillingPartyParticularLoaded) {
            final List<BillModel> bills = state.bills;
            // Calculate column totals
            double totalNetAmount = 0;
            double totalAmount = 0;
            double totalTDS = 0;
            double totalGST = 0;
            final rows = bills.map((bill) {
              String formattedDate =
                  DateFormat.yMMMd().format(DateTime.parse(bill.date!));

              double netAmount = double.parse(bill.netAmount.toString());
              double totalAmt = double.parse(bill.totalAmount.toString());
              double tdsAmount = double.parse(bill.tDSAmount.toString());
              double gstAmount = (double.parse(bill.cGSTAmount ?? "0") +
                  double.parse(bill.sGSTAmount ?? "0"));

              // Accumulate totals
              totalNetAmount += netAmount;
              totalAmount += totalAmt;
              totalTDS += tdsAmount;
              totalGST += gstAmount;

              return DataRow(cells: [
                DataCell(Text(bill.billNumber.toString())),
                DataCell(Text(formattedDate)),
                DataCell(Text(double.parse(bill.netAmount.toString())
                    .toStringAsFixed(2))),
                DataCell(Text(double.parse(bill.totalAmount.toString())
                    .toStringAsFixed(2))),
                DataCell(Text(double.parse(bill.tDSAmount.toString())
                    .toStringAsFixed(2))),
                DataCell(Text(
                    "${double.parse(bill.cGSTAmount ?? "0") + double.parse(bill.sGSTAmount ?? "0")}")),
                DataCell(IconButton(
                  icon: Icon(
                    Icons.download,
                    color: theme.canvasColor,
                  ),
                  onPressed: () {
                    context.pushNamed(RoutesName.pdfPreviewScreen, extra: bill);
                  },
                )),
              ]);
            }).toList();

            // Add the summary row at the end
            rows.add(
              DataRow(
                cells: [
                  DataCell(Text(
                    "Total",
                    style: theme.textTheme.titleLarge!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
                  )),
                  DataCell(Text("-")), // No total for Date
                  DataCell(Text(
                    totalNetAmount.toStringAsFixed(2),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text(
                    totalAmount.toStringAsFixed(2),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text(
                    totalTDS.toStringAsFixed(2),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text(
                    totalGST.toStringAsFixed(2),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text("")), // Empty cell for PDF icon
                ],
              ),
            );

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns: [
                DataColumn(
                    label: Text(
                  "Bill No.",
                  style: theme.textTheme.titleLarge!.copyWith(fontSize: 14),
                )),
                DataColumn(
                    label: Text(
                  "Date",
                  style: theme.textTheme.titleLarge!.copyWith(fontSize: 14),
                )),
                DataColumn(
                    label: Text(
                  "Net Amount",
                  style: theme.textTheme.titleLarge!.copyWith(fontSize: 14),
                )),
                DataColumn(
                    label: Text(
                  "Total Amount",
                  style: theme.textTheme.titleLarge!.copyWith(fontSize: 14),
                )),
                DataColumn(
                    label: Text(
                  "TDS",
                  style: theme.textTheme.titleLarge!.copyWith(fontSize: 14),
                )),
                DataColumn(
                    label: Text(
                  "GST",
                  style: theme.textTheme.titleLarge!.copyWith(fontSize: 14),
                )),
                DataColumn(
                    label: Text(
                  "PDF",
                  style: theme.textTheme.titleLarge!.copyWith(fontSize: 14),
                )),
              ], rows: rows),
            );
          } else {
            return Center(
              child: Text(
                "Something went wrong!",
                style: theme.textTheme.titleMedium!.copyWith(fontSize: 14),
              ),
            );
          }
        },
      ),
    );
  }
}
