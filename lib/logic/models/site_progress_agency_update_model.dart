class SiteProgressAgencyUpdateModel {
  String? agencyId;
  String? workTypeId;
  bool? isSelected;

  SiteProgressAgencyUpdateModel(
      {this.agencyId, this.workTypeId, this.isSelected});

  SiteProgressAgencyUpdateModel.fromJson(Map<String, dynamic> json) {
    agencyId = json['agencyId'];
    workTypeId = json['workTypeId'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agencyId'] = this.agencyId;
    data['workTypeId'] = this.workTypeId;
    data['isSelected'] = this.isSelected;
    return data;
  }
}
