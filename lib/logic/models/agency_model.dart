class AgencyModel {
  String? sId;
  String? name;
  List<String>? workType;
  String? description;
  String? gSTnumber;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  AgencyModel(
      {this.sId,
      this.name,
      this.workType,
      this.description,
      this.gSTnumber,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  AgencyModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    workType = json['WorkType'].cast<String>();
    description = json['Description'];
    gSTnumber = json['GSTnumber'] ?? '';
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['WorkType'] = this.workType;
    data['Description'] = this.description;
    data['GSTnumber'] = this.gSTnumber;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
