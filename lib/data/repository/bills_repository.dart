

import 'package:construction_mate/data/datasource/bills_data_source.dart';
import 'package:construction_mate/logic/models/bill_item_model.dart';

abstract class BillsRepository{

    void addBill(
      {required String date,
      required List<BillItemModel> billItems,
      required String sgst,
      required String cgst,
      required String tds,
      required String partyId});
}

class BillsRepositoryImpl extends BillsRepository{
  final BillsDataSource billsDataSource = BillsDataSourceImpl();
  @override
  void addBill({required String date, required List<BillItemModel> billItems, required String sgst, required String cgst, required String tds, required String partyId}) async{
    try{
        billsDataSource.addBill(date: date, billItems: billItems, sgst: sgst, cgst: cgst, tds: tds, partyId: partyId);
    }
    catch(e){
        print(e.toString());
    }
  }
}