// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MaterialModel {
  final String? id;
  final String? projectId;
  final String materialName;
  final String quantity;
  final String unit;
  final String description;
  final String date;

  MaterialModel(
      {this.id,
      this.projectId,
      required this.materialName,
      required this.quantity,
      required this.unit,
      required this.description,
      required this.date});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'projectId': projectId,
      'name': materialName,
      'quantity': quantity,
      'unit': unit,
      'description': description,
      'date': date,
    };
  }

  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
      id: map['_id'],
      projectId: map['projectId'] != null ? map['projectId'] as String : null,
      materialName: map['name'] as String,
      quantity: (map['quantity'] as num).toString(),
      unit: map['unit'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialModel.fromJson(String source) =>
      MaterialModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
