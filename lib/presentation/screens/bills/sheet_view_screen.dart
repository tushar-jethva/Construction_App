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
            final rows = bills.map((bill) {
              String formattedDate =
                  DateFormat.yMMMd().format(DateTime.parse(bill.date!));

              return DataRow(cells: [
                DataCell(Text(bill.billNumber.toString())),
                DataCell(Text(formattedDate)),
                DataCell(Text(bill.netAmount.toString())),
                DataCell(Text(bill.totalAmount.toString())),
                DataCell(Text(bill.tDSAmount.toString())),
                DataCell(Text("${bill.cGSTAmount! + bill.sGSTAmount!}")),
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
