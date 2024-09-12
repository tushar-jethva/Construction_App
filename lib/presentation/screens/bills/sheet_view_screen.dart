import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/pdf/pdf_generate.dart';
import 'package:construction_mate/logic/controllers/BillingPartyParticularBloc/billing_party_particular_bloc.dart';
import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MySheetViewScreen extends StatefulWidget {
  final String partyId;
  const MySheetViewScreen({super.key, required this.partyId});

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

  void _generatePDF({required BillModel bill}) async {
    final pdfGenerator = PDFGenerator();
    final pdfData = await pdfGenerator.createInvoicePDF(bill: bill);

    // Share the generated PDF
    await pdfGenerator.sharePDF(pdfData);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        title: const Text("Sheet View"),
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
              return DataRow(cells: [
                const DataCell(Text("1")),
                DataCell(Text(bill.netAmount.toString())),
                DataCell(Text(bill.totalAmount.toString())),
                DataCell(Text(bill.tDSAmount.toString())),
                DataCell(Text("${bill.cGSTAmount! + bill.sGSTAmount!}")),
                DataCell(IconButton(
                  icon: Icon(Icons.download),
                  onPressed: () {
                    context.pushNamed(RoutesName.pdfPreviewScreen, extra: bill);
                  },
                )),
              ]);
            }).toList();

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns: const [
                DataColumn(label: Text("Bill No.")),
                DataColumn(label: Text("Net Amount")),
                DataColumn(label: Text("Total Amount")),
                DataColumn(label: Text("TDS")),
                DataColumn(label: Text("GST")),
                DataColumn(label: Text("PDF")),
              ], rows: rows),
            );
          } else {
            return const Center(
              child: Text("Something went wrong!"),
            );
          }
        },
      ),
    );
  }
}
