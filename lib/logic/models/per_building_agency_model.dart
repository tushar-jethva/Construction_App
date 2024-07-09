import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class PerBuildingAgencyModel {

  final String workType;
  final String nameOfAgency;
  final List<int> floors;
  final double pricePerFeet;
  final String description;
  PerBuildingAgencyModel({
    required this.workType,
    required this.nameOfAgency,
    required this.floors,
    required this.pricePerFeet,
    required this.description,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'workType': workType,
      'nameOfAgency': nameOfAgency,
      'floors': floors,
      'pricePerFeet': pricePerFeet,
      'description': description,
    };
  }

  factory PerBuildingAgencyModel.fromMap(Map<String, dynamic> map) {
    return PerBuildingAgencyModel(
      workType: map['workType'] as String,
      nameOfAgency: map['nameOfAgency'] as String,
      floors: List<int>.from((map['floors'] as List<int>)),
      pricePerFeet: map['pricePerFeet'] as double,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PerBuildingAgencyModel.fromJson(String source) => PerBuildingAgencyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
