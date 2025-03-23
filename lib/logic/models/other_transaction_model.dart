class OtherTransactionModel {
  String? entryType;
  String? amount;
  String? partieId;
  String? projectId;
  String? description;
  String? transactionType;

  OtherTransactionModel(
      {this.entryType,
      this.amount,
      this.partieId,
      this.projectId,
      this.description,
      this.transactionType});

  OtherTransactionModel.fromJson(Map<String, dynamic> json) {
    entryType = json['entryType'];
    amount = json['amount'];
    partieId = json['partieId'];
    projectId = json['projectId'];
    description = json['description'];
    transactionType = json['transactionType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entryType'] = this.entryType;
    data['amount'] = this.amount;
    data['partieId'] = this.partieId;
    data['projectId'] = this.projectId;
    data['description'] = this.description;
    data['transactionType'] = this.transactionType;
    return data;
  }
}
