
import 'package:construction_mate/core/pdf/pdf_generate.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class MyPdfPreview extends StatelessWidget {
  const MyPdfPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(build: (context) => PDFGenerator().createInvoicePDF(),),
    );
  }
}