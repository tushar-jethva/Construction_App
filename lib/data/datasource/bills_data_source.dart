import 'dart:convert';

import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/bill_model.dart';
import 'package:http/http.dart' as http;
import 'package:construction_mate/logic/models/bill_item_model.dart';

abstract class BillsDataSource{
  void addBill({required String date, required List<BillItemModel> billItems,required String sgst, required String cgst, required String tds});
}

class BillsDataSourceImpl extends BillsDataSource{
  @override
  void addBill({required String date, required List<BillItemModel> billItems, required String sgst, required String cgst, required String tds}) async{
    try{
      
      await http.post(Uri.parse(API.ADD_BILL),body: jsonEncode({
        'date': date,
        'Items' : billItems.map((e) => e.toString()).toList(),
        'SGST' : sgst,
        'CGST' : cgst,
        'TDS' : tds
      }));

    }
    catch(e){
      print(e.toString());
    }
  }
}