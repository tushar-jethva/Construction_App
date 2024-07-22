class FloorModel {
  int? floorIndex;
  bool? isCompleted;
  String? completeDate;

  FloorModel({this.floorIndex, this.isCompleted, this.completeDate});

  FloorModel.fromJson(Map<String, dynamic> json) {
    floorIndex = json['floorIndex'];
    isCompleted = json['isSelect'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['floorIndex'] = this.floorIndex;
    data['isCompleted'] = this.isCompleted;
    data['completeDate'] = this.completeDate;
    return data;
  }
}
