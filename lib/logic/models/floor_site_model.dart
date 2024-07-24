class FloorSiteModel {
  String? sId;
  String? projectId;
  String? buildingId;
  int? floorIndex;
  bool? isCompleted;
  String? completedDate;
  List<WorkStatus>? workStatus;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  FloorSiteModel(
      {this.sId,
      this.projectId,
      this.buildingId,
      this.floorIndex,
      this.isCompleted,
      this.completedDate,
      this.workStatus,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  FloorSiteModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    projectId = json['projectId'];
    buildingId = json['buildingId'];
    floorIndex = json['floorIndex'];
    isCompleted = json['isCompleted'];
    completedDate = json['completedDate'] ?? DateTime.now().toString();
    if (json['workStatus'] != null) {
      workStatus = <WorkStatus>[];
      json['workStatus'].forEach((v) {
        workStatus!.add(new WorkStatus.fromJson(v));
      });
    }
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['projectId'] = this.projectId;
    data['buildingId'] = this.buildingId;
    data['floorIndex'] = this.floorIndex;
    data['isCompleted'] = this.isCompleted;
    data['completedDate'] = this.completedDate;
    if (this.workStatus != null) {
      data['workStatus'] = this.workStatus!.map((v) => v.toJson()).toList();
    }
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class WorkStatus {
  String? agencyId;
  String? workTypeId;
  String? agencyName;
  String? workTypeName;
  bool? isCompleted;
  String? completedDate;
  String? pricePerFeet;
  String? description;
  String? sId;

  WorkStatus(
      {this.agencyId,
      this.workTypeId,
      this.isCompleted,
      this.completedDate,
      this.pricePerFeet,
      this.description,
      this.sId});

  WorkStatus.fromJson(Map<String, dynamic> json) {
    agencyId = json['agencyId'];
    workTypeId = json['workTypeId'];
    agencyName = json['agencyName'];
    workTypeName = json['workTypeName'];
    isCompleted = json['isCompleted'];
    completedDate = json['completedDate'];
    pricePerFeet = (json['pricePerFeet'] as dynamic).toString();
    description = json['description'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agencyId'] = this.agencyId;
    data['workTypeId'] = this.workTypeId;
    data['isCompleted'] = this.isCompleted;
    data['completedDate'] = this.completedDate;
    data['pricePerFeet'] = this.pricePerFeet;
    data['description'] = this.description;
    data['_id'] = this.sId;
    return data;
  }
}
