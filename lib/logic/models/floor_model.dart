class FloorModel {
  String? floorName;
  bool? isCompleted;
  String? completeDate;

  FloorModel({this.floorName, this.isCompleted, this.completeDate});

  FloorModel.fromJson(Map<String, dynamic> json) {
    floorName = json['floorName'];
    isCompleted = json['isSelect'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['floorIndex'] = this.floorName;
    data['isCompleted'] = this.isCompleted;
    data['completeDate'] = this.completeDate;
    return data;
  }
}
