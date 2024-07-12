import 'dart:convert';

class BuildingModel {
  String? sId;
  String? name;
  String? description;
  String? startDate;
  int? totalFloor;
  int? unitPerFloor;
  int? totalAmount;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BuildingModel(
      {this.sId,
      this.name,
      this.description,
      this.startDate,
      this.totalFloor,
      this.unitPerFloor,
      this.totalAmount,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  BuildingModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    description = json['Description'];
    startDate = json['StartDate'];
    totalFloor = json['TotalFloor'];
    unitPerFloor = json['UnitPerFloor'];
    totalAmount = json['TotalAmount'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJsonAddBuilding() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProjectId'] = this.sId;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['TotalFloor'] = this.totalFloor.toString();
    data['UnitPerFloor'] = this.unitPerFloor.toString();
    return data;
  }

  String toJson() => json.encode(toJsonAddBuilding());
}
