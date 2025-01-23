import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
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

  int getTotalSquareFeet({required List<Items> items}) {
    int totalSquareFeet = 0;
    for (var item in items) {
      totalSquareFeet += item.squreFeet!;
    }
    return totalSquareFeet;
  }

  Future<Uint8List> createInvoicePDF({required BillModel bill}) async {
    final pdf = pw.Document();
    final Uint8List imageData = await _loadAssetImage('assets/logos/s2p.jpeg');
    final String formattedDate =
        DateFormat.yMMMd().format(DateTime.parse(bill.date!));

    final List<Items> listOfItems = List.from(bill.items!)
      ..add(
        Items(amount: "---------------------"),
      )
      ..add(Items(amount: "Net Amount: ${bill.netAmount}"))
      ..add(Items(
          description: "SGST",
          rate: bill.sGST,
          amount: double.parse(bill.sGSTAmount ?? '0').toStringAsFixed(2),
          per: "%")) // Add SGST item
      ..add(Items(
          description: "CGST",
          rate: bill.cGST,
          amount: double.parse(bill.cGSTAmount ?? '0').toStringAsFixed(2),
          per: "%"))
      ..add(Items(
          description: "Total",
          squreFeet: getTotalSquareFeet(items: bill.items!),
          amount:
              "Total Amount: ${double.parse(bill.totalAmount ?? '0').toStringAsFixed(2)}",
          per: ""));
    pdf.addPage(
      pw.MultiPage(
        margin:
            const pw.EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 30),
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Text('TAX INVOICE', style: const pw.TextStyle(fontSize: 14)),
            pw.SizedBox(height: 20),
            _buildHeader(imageData: imageData, date: formattedDate),
            pw.SizedBox(height: 20),
            _buildBillingAndSupplyDetails(bill: bill),
            pw.SizedBox(height: 20),
            _buildItemsTable(items: listOfItems),
            pw.SizedBox(height: 20),
            _buildTaxableTable(bill: bill),
            pw.SizedBox(height: 20),
            _buildTotalAmountSection(bill: bill)
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
        ]),
      )
    ]);
  }

  // Define the `toElement` helper function to map `Items` to a List<String>
  int currIndex = 1;
  List<String> toElement(Items item, int index) {
    return [
      item.description == null ? "" : " ${(currIndex++).toString()}",
      item.description ?? "",
      item.hSNCode ?? "",
      item.squreFeet == null ? "" : item.squreFeet.toString(),
      item.rate == null ? "" : item.rate.toString(),
      item.description != "Total" && item.description != null
          ? item.per == "%"
              ? "%"
              : "Sq."
          : "",
      item.amount.toString()
    ];
  }

// Building the items table section
  pw.Widget _buildItemsTable({required List<Items> items}) {
    // Define the header for the table
    const tableHeaders = [
      'Sr No.',
      'Description',
      'HSN',
      'Quantity',
      'Rate',
      'Per',
      'Amount'
    ];

    return pw.TableHelper.fromTextArray(
      cellDecoration: (index, data, rowNum) {
        return const pw.BoxDecoration(
            border: pw.Border.new(
                left: pw.BorderSide(color: PdfColors.black, width: 1),
                right: pw.BorderSide(color: PdfColors.black, width: 1)));
      },
      headerCellDecoration: const pw.BoxDecoration(
          border: pw.Border.new(
              left: pw.BorderSide(color: PdfColors.black, width: 1),
              right: pw.BorderSide(color: PdfColors.black, width: 1))),
      border: const pw.TableBorder(
        left: pw.BorderSide(color: PdfColors.black, width: 1),
        right: pw.BorderSide(color: PdfColors.black, width: 1),
        bottom: pw.BorderSide(color: PdfColors.black, width: 1),
      ),
      headerAlignment: pw.Alignment.center,
      headerDecoration: pw.BoxDecoration(
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(2)),
        border: pw.Border.all(color: PdfColors.black, width: 1),
      ),
      headerHeight: 25,
      cellPadding: const pw.EdgeInsets.all(10),
      columnWidths: const {
        0: pw.FlexColumnWidth(0.2),
        1: pw.FlexColumnWidth(1),
        2: pw.FlexColumnWidth(0.34),
        3: pw.FlexColumnWidth(0.4),
        4: pw.FlexColumnWidth(0.3),
        5: pw.FlexColumnWidth(0.2),
        6: pw.FlexColumnWidth(0.6)
      },
      headerStyle: pw.TextStyle(
        color: PdfColors.black,
        fontSize: 10,
        fontWeight: pw.FontWeight.bold,
      ),
      cellStyle: const pw.TextStyle(
        color: PdfColors.black,
        fontSize: 10,
      ),
      headers: List<String>.generate(
        tableHeaders.length,
        (col) => tableHeaders[col],
      ),
      data: List<List<String>>.generate(
        items.length,
        (index) => toElement(
            items[index], index), // Map each `Items` object to table row
      ),
    );
  }

  pw.Widget _buildTaxableTable({required BillModel bill}) {
    return pw.Table(
      border: pw.TableBorder.all(),
      columnWidths: {
        0: pw.FlexColumnWidth(2), // HSN/SAC column
        1: pw.FlexColumnWidth(2), // Taxable Value column
        2: pw.FlexColumnWidth(1), // CGST Rate column
        3: pw.FlexColumnWidth(2), // CGST Amount column
        4: pw.FlexColumnWidth(1), // SGST/UGST Rate column
        5: pw.FlexColumnWidth(2), // SGST/UGST Amount column
        6: pw.FlexColumnWidth(2), // Total Tax Amount column
      },
      children: [
        // Header Row
        pw.TableRow(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text('Total',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text('Taxable Value',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(5),
              child: pw.Text('CGST',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                  )),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text('Amount',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text('SGST/UGST',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text('Amount',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text('Total Tax Amount',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
          ],
        ),
        // Sub-header Row
        pw.TableRow(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(''),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(''),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text('Rate',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(''),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text('Rate',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(''),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(''),
            ),
          ],
        ),
        // Data Rows
        pw.TableRow(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(''),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(bill.netAmount.toString()),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(bill.cGST.toString()),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(bill.cGSTAmount.toString()),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(bill.sGST.toString()),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(
                  double.parse(bill.sGSTAmount ?? '0').toStringAsFixed(2)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(
                  double.parse(bill.totalAmount ?? '0').toStringAsFixed(2)),
            ),
          ],
        ),
        // Total Row
        pw.TableRow(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text('Total',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(
                  double.parse(bill.netAmount ?? '0').toStringAsFixed(2),
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(''),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(
                  double.parse(bill.cGSTAmount ?? '0').toStringAsFixed(2),
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(''),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(
                  double.parse(bill.sGSTAmount ?? '0').toStringAsFixed(2),
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.all(8),
              child: pw.Text(
                  double.parse(bill.totalAmount ?? '0').toStringAsFixed(2),
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }

  // Total amount section
  pw.Widget _buildTotalAmountSection({required BillModel bill}) {
    return pw.Container(
      padding: const pw.EdgeInsets.all(8),
      decoration: pw.BoxDecoration(border: pw.Border.all()),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _buildAmountRow('Work Bill Amount',
              double.parse(bill.netAmount ?? '0').toStringAsFixed(2)),
          _buildAmountRow('SGST (${bill.sGST}%)',
              double.parse(bill.sGSTAmount ?? '0').toStringAsFixed(2)),
          _buildAmountRow('CGST (${bill.cGST}%)',
              double.parse(bill.cGSTAmount ?? '0').toStringAsFixed(2)),
          pw.SizedBox(height: 10),
          _buildAmountRow('TOTAL AMOUNT',
              double.parse(bill.totalAmount ?? '0').toStringAsFixed(2),
              isBold: true),
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
                : const pw.TextStyle()),
        pw.Text(value,
            style: isBold
                ? pw.TextStyle(fontWeight: pw.FontWeight.bold)
                : const pw.TextStyle()),
      ],
    );
  }

  // Method to share the PDF
  Future<void> sharePDF(Uint8List pdfData) async {
    await Printing.sharePdf(bytes: pdfData, filename: 'invoice.pdf');
  }
}
