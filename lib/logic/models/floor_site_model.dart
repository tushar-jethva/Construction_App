class FloorSiteModel {
  String? projectId;
  String? buildingId;
  String? floorName;
  num? squreFeet;
  bool? isCompleted;
  String? completedDate;
  List<WorkStatus>? workStatus;
  num? completedAgenciesCount;
  num? progress;

  FloorSiteModel(
      {this.projectId,
      this.buildingId,
      this.floorName,
      this.squreFeet,
      this.isCompleted,
      this.completedDate,
      this.workStatus,
      this.completedAgenciesCount,
      this.progress});

  FloorSiteModel.fromJson(Map<String, dynamic> json) {
    projectId = json['projectId'] ?? '';
    buildingId = json['buildingId'] ?? '';
    floorName = json['floorName'] ?? '';
    squreFeet = json['squreFeet'] ?? 0;
    isCompleted = json['isCompleted'] ?? false;
    completedDate = json['completedDate'] ?? DateTime.now().toString();
    progress = json['progress'] ?? 0;
    completedAgenciesCount = json['completedAgenciesCount'] ?? 0;
    if (json['workStatus'] != null && json['workStatus'].isNotEmpty) {
      workStatus = <WorkStatus>[];
      json['workStatus'].forEach((v) {
        workStatus?.add(WorkStatus.fromJson(v));
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
      data['workStatus'] = this.workStatus?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WorkStatus {
  String? agencyId;
  String? workTypeId;
  String? agencyName;
  String? workTypeName;
  num? price;
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
    price = json['price'] ?? 0;
    description = json['description'] ?? '';
    isCompleted = json['isCompleted'] ?? false;
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
