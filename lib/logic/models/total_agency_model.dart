class TotalAgencyModel {
  String? sId;
  String? name;
  List<WorkType>? workType;
  String? description;
  String? gSTnumber;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? totalAccount;
  num? totalPayable;
  num? totalPaid;

  TotalAgencyModel(
      {this.sId,
      this.name,
      this.workType,
      this.description,
      this.gSTnumber,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalAccount,
      this.totalPaid,
      this.totalPayable});

  TotalAgencyModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    if (json['WorkType'] != null) {
      workType = <WorkType>[];
      json['WorkType'].forEach((v) {
        workType!.add(new WorkType.fromJson(v));
      });
    }
    description = json['Description'];
    gSTnumber = json['GSTnumber'] ?? '';
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalAccount = (json['TotalAccount'] as dynamic).toString();
    totalPayable = json['TotalPayable'] ?? 0;
    totalPaid = json['TotalPaid'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    if (this.workType != null) {
      data['WorkType'] = this.workType!.map((v) => v.toJson()).toList();
    }
    data['Description'] = this.description;
    data['GSTnumber'] = this.gSTnumber;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['TotalAccount'] = this.totalAccount;
    return data;
  }
}

class WorkType {
  String? sId;
  String? name;

  WorkType({this.sId, this.name});

  WorkType.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    return data;
  }
}
