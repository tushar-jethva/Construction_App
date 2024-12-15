import 'package:construction_mate/logic/models/fitler_option_model.dart';
import 'package:construction_mate/logic/models/others_transaction_data_model.dart';

class TdsModel {
  final num totalTds;
  final List<OthersTransactionDataModel> tdsList;
  final FilterOption fileterOption;

  TdsModel(
      {required this.totalTds,
      required this.tdsList,
      required this.fileterOption});
}



  
