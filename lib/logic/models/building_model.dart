import 'dart:convert';

class BuildingModel {
  final String buildingName;
  final String startDate;
  final String endDate;
  final int noOfFloors;
  final double unitPerFloor;

  BuildingModel({required this.buildingName, required this.startDate, required this.endDate, required this.noOfFloors, required this.unitPerFloor});



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'buildingName': buildingName,
      'startDate': startDate,
      'endDate': endDate,
      'noOfFloors': noOfFloors,
      'unitPerFloor': unitPerFloor,
    };
  }

  factory BuildingModel.fromMap(Map<String, dynamic> map) {
    return BuildingModel(
      buildingName: map['buildingName'] as String,
      startDate: map['startDate'] as String,
      endDate: map['endDate'] as String,
      noOfFloors: map['noOfFloors'] as int,
      unitPerFloor: map['unitPerFloor'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory BuildingModel.fromJson(String source) => BuildingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
