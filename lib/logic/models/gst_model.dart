import 'package:construction_mate/logic/models/fitler_option_model.dart';
import 'package:construction_mate/logic/models/others_transaction_data_model.dart';

class GstModel {
  final num totalGst;
  final List<OthersTransactionDataModel> gstList;
  final FilterOption fileterOption;

  GstModel(
      {required this.totalGst,
      required this.gstList,
      required this.fileterOption});
}
