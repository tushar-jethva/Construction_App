import 'package:construction_mate/logic/models/fitler_option_model.dart';
import 'package:construction_mate/logic/models/others_transaction_data_model.dart';

class OtherExpenseModel {
  final num totalExpense;
  final List<OthersTransactionDataModel> expenseList;
  final FilterOption fileterOption;

  OtherExpenseModel(
      {required this.totalExpense,
      required this.expenseList,
      required this.fileterOption});
}
