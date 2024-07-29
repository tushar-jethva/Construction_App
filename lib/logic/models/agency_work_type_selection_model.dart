class AgencyWorkTypeSelectModel {
  String? sId;
  String? name;
  bool? isSelected;

  AgencyWorkTypeSelectModel({this.sId, this.name, this.isSelected});

  AgencyWorkTypeSelectModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['isSelected'] = this.isSelected;
    return data;
  }
}
