class WorkTypeModel {
  String? sId;
  String? name;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  WorkTypeModel(
      {this.sId,
      this.name,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  WorkTypeModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
