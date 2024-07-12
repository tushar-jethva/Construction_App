// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProjectModel {
  String? sId;
  String? name;
  String? description;
  int? paymentIn;
  int? paymentOut;
  String? startDate;
  String? address;
  int? totalBuilding;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;

  ProjectModel(
      {this.sId,
      this.name,
      this.description,
      this.paymentIn,
      this.paymentOut,
      this.startDate,
      this.address,
      this.totalBuilding,
      this.isDeleted,
      this.createdAt,
      this.updatedAt});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    description = json['Description'];
    paymentIn = json['PaymentIn'];
    paymentOut = json['PaymentOut'];
    startDate = json['StartDate'];
    address = json['Address'];
    totalBuilding = json['TotalBuilding'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }


  Map<String, dynamic> toJsonAddProject() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['Address'] = this.address;
    return data;
  }



  String toJson() => json.encode(toJsonAddProject());

}
