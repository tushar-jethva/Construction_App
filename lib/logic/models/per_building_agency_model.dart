import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class PerBuildingAgencyModel {
  final String? workType;
  final String? nameOfAgency;
  final List<int>? floors;
  final String? pricePerFeet;
  final String? description;
  final String? agencyId;
  PerBuildingAgencyModel({
    this.workType,
    this.nameOfAgency,
    this.floors,
    this.pricePerFeet,
    this.description,
    this.agencyId
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
      workType: map['workTypeName'] as String,
      nameOfAgency: map['agencyName'] as String,
      floors: List<int>.from((map['floorIndices'] as List<dynamic>)),
      pricePerFeet: (map['price'] as dynamic).toString(),
      agencyId: map['agencyId'] as String
    );
  }

  String toJson() => json.encode(toMap());

  factory PerBuildingAgencyModel.fromJson(String source) =>
      PerBuildingAgencyModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
