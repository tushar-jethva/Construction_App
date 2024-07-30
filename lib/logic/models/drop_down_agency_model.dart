class DropDownAgencyModel {
  String? agencyId;
  String? agencyName;
  List<WorkTypes>? workTypes;

  DropDownAgencyModel({this.agencyId, this.agencyName, this.workTypes});

  DropDownAgencyModel.fromJson(Map<String, dynamic> json) {
    agencyId = json['_id'];
    agencyName = json['Name'];
    if (json['workTypes'] != null) {
      workTypes = <WorkTypes>[];
      json['workTypes'].forEach((v) {
        workTypes!.add(new WorkTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agencyId'] = this.agencyId;
    data['agencyName'] = this.agencyName;
    if (this.workTypes != null) {
      data['workTypes'] = this.workTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WorkTypes {
  String? workTypeId;
  String? workTypeName;

  WorkTypes({this.workTypeId, this.workTypeName});

  WorkTypes.fromJson(Map<String, dynamic> json) {
    workTypeId = json['workTypeId'];
    workTypeName = json['workTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['workTypeId'] = this.workTypeId;
    data['workTypeName'] = this.workTypeName;
    return data;
  }
}
