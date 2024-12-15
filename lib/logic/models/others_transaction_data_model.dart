class OthersTransactionDataModel {
  String? sId;
  String? description;
  String? date;
  String? companyId;
  String? transactionType;
  int? amount;
  String? entryType;
  bool? isCompleted;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  OthersTransactionDataModel(
      {this.sId,
      this.description,
      this.date,
      this.companyId,
      this.transactionType,
      this.amount,
      this.entryType,
      this.isCompleted,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  OthersTransactionDataModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    date = json['date'];
    companyId = json['CompanyId'];
    transactionType = json['transactionType'];
    amount = json['amount'];
    entryType = json['entryType'];
    isCompleted = json['isCompleted'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['date'] = this.date;
    data['CompanyId'] = this.companyId;
    data['transactionType'] = this.transactionType;
    data['amount'] = this.amount;
    data['entryType'] = this.entryType;
    data['isCompleted'] = this.isCompleted;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}