class ProjectPartieModel {
  int? totalCost;
  String? sId;
  String? name;
  String? agencyType;
  String? contactNumber;
  String? email;

  ProjectPartieModel(
      {this.totalCost,
      this.sId,
      this.name,
      this.agencyType,
      this.contactNumber,
      this.email});

  ProjectPartieModel.fromJson(Map<String, dynamic> json) {
    totalCost = json['totalCost'];
    sId = json['_id'];
    name = json['Name'];
    agencyType = json['agencyType'];
    contactNumber = json['ContactNumber'];
    email = json['Email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCost'] = this.totalCost;
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['agencyType'] = this.agencyType;
    data['ContactNumber'] = this.contactNumber;
    data['Email'] = this.email;
    return data;
  }
}
