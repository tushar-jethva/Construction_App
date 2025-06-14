class GetRentalModel {
  String? sId;
  String? companyId;
  String? partieId;
  String? projectId;
  String? name;
  String? description;
  int? quantity;
  int? priceperunit;
  int? totalprice;
  String? unit;
  String? date;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  GetRentalModel(
      {this.sId,
      this.companyId,
      this.partieId,
      this.projectId,
      this.name,
      this.description,
      this.quantity,
      this.priceperunit,
      this.totalprice,
      this.unit,
      this.date,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  GetRentalModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    companyId = json['companyId'];
    partieId = json['partieId'];
    projectId = json['projectId'];
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    priceperunit = json['priceperunit'];
    totalprice = json['totalprice'];
    unit = json['unit'];
    date = json['date'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['companyId'] = this.companyId;
    data['partieId'] = this.partieId;
    data['projectId'] = this.projectId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['priceperunit'] = this.priceperunit;
    data['totalprice'] = this.totalprice;
    data['unit'] = this.unit;
    data['date'] = this.date;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
