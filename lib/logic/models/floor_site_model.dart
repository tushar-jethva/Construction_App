class FloorSiteModel {
  String? projectId;
  String? buildingId;
  String? floorName;
  String? squreFeet;
  bool? isCompleted;
  String? completedDate;
  List<WorkStatus>? workStatus;

  FloorSiteModel(
      {this.projectId,
      this.buildingId,
      this.floorName,
      this.squreFeet,
      this.isCompleted,
      this.completedDate,
      this.workStatus});

  FloorSiteModel.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'] ?? '';
    buildingId = json['buildingId'] ?? '';
    floorName = json['floorName'] ?? '';
    squreFeet = (json['squreFeet'] as dynamic).toString();
    isCompleted = json['isCompleted'] ?? false;
    completedDate = json['completedDate'] ?? DateTime.now().toString();
    if (json['workStatus'] != null) {
      workStatus = <WorkStatus>[];
      json['workStatus'].forEach((v) {
        workStatus!.add(new WorkStatus.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectId'] = this.projectId;
    data['buildingId'] = this.buildingId;
    data['floorName'] = this.floorName;
    data['squreFeet'] = this.squreFeet;
    data['isCompleted'] = this.isCompleted;
    data['completedDate'] = this.completedDate;
    if (this.workStatus != null) {
      data['workStatus'] = this.workStatus!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WorkStatus {
  String? agencyId;
  String? workTypeId;
  String? agencyName;
  String? workTypeName;
  String? price;
  String? description;
  bool? isCompleted;
  String? completedDate;

  WorkStatus(
      {this.agencyId,
      this.workTypeId,
      this.agencyName,
      this.workTypeName,
      this.price,
      this.description,
      this.isCompleted,
      this.completedDate});

  WorkStatus.fromJson(Map<String, dynamic> json) {
    agencyId = json['agencyId'] ?? '';
    workTypeId = json['workTypeId'] ?? '';
    agencyName = json['agencyName'] ?? '';
    workTypeName = json['workTypeName'] ?? '';
    price = (json['price'] as dynamic).toString();
    description = json['description'] ?? '';
    isCompleted = json['isCompleted'];
    completedDate = json['completedDate'] ?? DateTime.now().toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agencyId'] = this.agencyId;
    data['workTypeId'] = this.workTypeId;
    data['agencyName'] = this.agencyName;
    data['workTypeName'] = this.workTypeName;
    data['price'] = this.price;
    data['description'] = this.description;
    data['isCompleted'] = this.isCompleted;
    data['completedDate'] = this.completedDate;
    return data;
  }
}
