
import 'package:construction_mate/core/pdf/pdf_generate.dart';
import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class MyPdfPreview extends StatelessWidget {
  final BillModel bill;
  const MyPdfPreview({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(build: (context) => PDFGenerator().createInvoicePDF(bill: bill),),
    );
  }
}