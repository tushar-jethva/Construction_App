import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDFGenerator {
  // Method to create a PDF

  Future<Uint8List> _loadAssetImage(String path) async {
    final ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }

  Future<Uint8List> createInvoicePDF({required BillModel bill}) async {
    final pdf = pw.Document();
    final Uint8List imageData = await _loadAssetImage('assets/logos/s2p.jpeg');
    final String formattedDate =
        DateFormat.yMMMd().format(DateTime.parse(bill.date!));
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('TAX INVOICE', style: pw.TextStyle(fontSize: 14)),
                pw.SizedBox(height: 20),
                _buildHeader(imageData: imageData, date: formattedDate),
                pw.SizedBox(height: 20),
                _buildBillingAndSupplyDetails(bill: bill),
                pw.SizedBox(height: 20),
                _buildItemsTable(),
                pw.SizedBox(height: 20),
                _buildItemsTable(),
                _buildTotalAmountSection(),
              ],
            )
          ];
        },
      ),
    );

    final output = await getApplicationDocumentsDirectory();
    final file = File("${output.path}/invoice.pdf");
    File f = await file.writeAsBytes(await pdf.save());
    return pdf.save();
  }

  // Header section
  pw.Widget _buildHeader({required Uint8List imageData, required String date}) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Row(children: [pw.Text("Ack Date: "), pw.Text(date)]),
        pw.Image(pw.MemoryImage(imageData))
      ],
    );
  }

  // Billing and Supply details section
  pw.Widget _buildBillingAndSupplyDetails({required BillModel bill}) {
    return pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
      pw.Expanded(
        child: pw.Table(border: pw.TableBorder.all(), children: [
          pw.TableRow(children: [
            pw.Padding(
                padding: const pw.EdgeInsets.only(
                    left: 6, right: 20, top: 10, bottom: 10),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("S2P PROJECTS",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 7),
                      pw.Text(
                          "138 , APEXA CHITRAKUT DHAM SOC B/H I.O.C COLONY KALAWAD ROAD RAJKOT GUJRAT 360005",
                          overflow: pw.TextOverflow.clip),
                      pw.Text("GSTIN/UIN: 24ABBFP1674M1Z1"),
                      pw.Text("State Name: Gujarat, Code: 24"),
                      pw.Text("E-Mail: S2PPROJECT2020@GMAIL.COM")
                    ])),
          ]),
          pw.TableRow(children: [
            pw.Padding(
                padding: const pw.EdgeInsets.only(
                    left: 6, right: 20, top: 10, bottom: 10),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Consignee (Ship to)"),
                      pw.SizedBox(height: 5),
                      pw.Text("${bill.partieId!.name}",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 7),
                      pw.Text("${bill.partieId!.shippingAddress}",
                          overflow: pw.TextOverflow.clip),
                      pw.Text("GSTIN/UIN: ${bill.partieId!.gSTnumber}"),
                      pw.Text("State Name: Gujarat, Code: 24"),
                      pw.Text("E-Mail : ${bill.partieId!.email}")
                    ])),
          ]),
          pw.TableRow(children: [
            pw.Padding(
                padding: const pw.EdgeInsets.only(
                    left: 6, right: 20, top: 10, bottom: 10),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Buyer (Bill to)"),
                      pw.SizedBox(height: 5),
                      pw.Text("${bill.partieId!.name}",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      pw.SizedBox(height: 7),
                      pw.Text("${bill.partieId!.billingAddress}",
                          overflow: pw.TextOverflow.clip),
                      pw.Text("GSTIN/UIN: ${bill.partieId!.gSTnumber}"),
                      pw.Text("State Name: Gujarat, Code: 24"),
                      pw.Text("Place of Supply: Gujarat"),
                      pw.Text("E-Mail : ${bill.partieId!.email}")
                    ])),
          ]),
        ]),
      ),
      pw.Expanded(
        child: pw.Table(border: pw.TableBorder.all(), children: [
          pw.TableRow(children: [
            pw.Padding(
                padding: const pw.EdgeInsets.all(8),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Invoice No."),
                      pw.Text("${bill.billNumber}",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ])),
            pw.Padding(
                padding: pw.EdgeInsets.all(8),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Dated"),
                      pw.Text("6-Jul-24",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ])),
          ]),
          pw.TableRow(children: [
            pw.Padding(
                padding: const pw.EdgeInsets.all(8),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Delivery Note"),
                      pw.Text("",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ])),
            pw.Padding(
                padding: pw.EdgeInsets.all(8),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Mode/Terms of Payment"),
                      pw.Text("",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ])),
          ]),
          pw.TableRow(children: [
            pw.Padding(
                padding: const pw.EdgeInsets.all(8),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Reference No. & Date."),
                      pw.Text("",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ])),
            pw.Padding(
                padding: pw.EdgeInsets.all(8),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Other References"),
                      pw.Text("",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ])),
          ]),
          pw.TableRow(children: [
            pw.Padding(
                padding: const pw.EdgeInsets.all(8),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Buyer's Order No."),
                      pw.Text("",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ])),
            pw.Padding(
                padding: pw.EdgeInsets.all(8),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Dated"),
                      pw.Text("6-Jul-24",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ])),
          ]),
          pw.TableRow(children: [
            pw.Padding(
                padding: const pw.EdgeInsets.all(8),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Dispatch Doc No."),
                      pw.Text("",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ])),
            pw.Padding(
                padding: pw.EdgeInsets.all(8),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Delivery Note Date"),
                      pw.Text("6-Jul-24",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ])),
          ]),
          pw.TableRow(children: [
            pw.Padding(
                padding: const pw.EdgeInsets.all(8),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Dispatched through"),
                      pw.Text("",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ])),
            pw.Padding(
                padding: pw.EdgeInsets.all(8),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Destination"),
                      pw.Text("",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ])),
          ]),
          pw.TableRow(children: [
            pw.Padding(
                padding: const pw.EdgeInsets.all(8),
                child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Invoice No."),
                      pw.Text("SRLAT7856/24",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
                    ])),
          ])
        ]),
      )
    ]);
  }

  // Table of items
  pw.Widget _buildItemsTable() {
    return pw.Wrap(
      children: [
        pw.Table(
          border: pw.TableBorder.all(),
          children: [
            pw.TableRow(children: []),
            // Add more table rows...
          ],
        ),
      ],
    );
  }

  // Total amount section
  pw.Widget _buildTotalAmountSection() {
    return pw.Container(
      padding: const pw.EdgeInsets.all(8),
      decoration: pw.BoxDecoration(border: pw.Border.all()),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _buildAmountRow('Work Bill Amount', '18,42,138.00'),
          _buildAmountRow('SGST (9%)', '1,65,792.42'),
          _buildAmountRow('CGST (9%)', '1,65,792.42'),
          _buildAmountRow('Round Off', ' 0.16'),
          pw.SizedBox(height: 10),
          _buildAmountRow('TOTAL AMOUNT', '21,73,723.00', isBold: true),
        ],
      ),
    );
  }

  // Utility function for total amount rows
  pw.Widget _buildAmountRow(String title, String value, {bool isBold = false}) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(title,
            style: isBold
                ? pw.TextStyle(fontWeight: pw.FontWeight.bold)
                : pw.TextStyle()),
        pw.Text(value,
            style: isBold
                ? pw.TextStyle(fontWeight: pw.FontWeight.bold)
                : pw.TextStyle()),
      ],
    );
  }

  // Method to share the PDF
  Future<void> sharePDF(Uint8List pdfData) async {
    await Printing.sharePdf(bytes: pdfData, filename: 'invoice.pdf');
  }
}
