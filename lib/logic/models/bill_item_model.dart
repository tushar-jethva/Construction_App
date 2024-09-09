class BillItemModel {
  final String HSNCode;
  final String itemDescription;
  final double squareFeet;
  final double rate;
  final double amount;

  BillItemModel(
      {required this.HSNCode,
      required this.itemDescription,
      required this.squareFeet,
      required this.rate,
      required this.amount});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map['HSNCode'] = this.HSNCode.toString();
    map["Description"] = this.itemDescription.toString();
    map['SqureFeet'] = this.squareFeet.toString();
    map['Rate'] = this.rate.toString();
    return map;
  }
}
