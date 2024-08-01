// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TransactionModel {
  String? sId;
  String? description;
  String? date;
  String? buildingId;
  String? agencyId;
  String? projectId;
  String? taskId;
  String? name;
  String? amount;
  String? entryType;
  bool? isCompleted;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  TransactionModel(
      {this.sId,
      this.description,
      this.date,
      this.buildingId,
      this.agencyId,
      this.projectId,
      this.taskId,
      this.amount,
      this.entryType,
      this.isCompleted,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.name});

  TransactionModel.fromMap(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    date = json['date'];
    buildingId = json['buildingId']?['_id'] ?? '';
    agencyId = json['agencyId']['_id'];
    amount = json['amount'].toString();
    entryType = json['entryType'];
    isCompleted = json['isCompleted'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    name = json['agencyId']['Name'];
    iV = json['__v'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['date'] = this.date;
    data['buildingId'] = this.buildingId;
    data['agencyId'] = this.agencyId;
    data['projectId'] = this.projectId;
    data['taskId'] = this.taskId;
    data['amount'] = this.amount;
    data['entryType'] = this.entryType;
    data['isCompleted'] = this.isCompleted;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
