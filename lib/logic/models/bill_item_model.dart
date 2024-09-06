
class BillItemModel{
  final String HSNCode;
  final String itemDescription;
  final double squareFeet;
  final double rate;
  final double amount;

  BillItemModel({required this.HSNCode, required this.itemDescription, required this.squareFeet, required this.rate, required this.amount});

}