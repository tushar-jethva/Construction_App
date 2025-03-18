// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MaterialModel {
  final String? id;
  final String? partieId;
  final String? projectId;
  final String name;
  final String quantity;
  final String priceperunit;
  final String unit;
  final String description;
  final String date;
  final String? hsncode;
  final String? gst;

  MaterialModel({
    this.id,
    this.partieId,
    this.projectId,
    required this.name,
    required this.quantity,
    required this.priceperunit,
    required this.unit,
    required this.description,
    required this.date,
    this.hsncode,
    this.gst,
  });

  // MaterialModel(
  //     {this.id,
  //     this.projectId,
  //     required this.materialName,
  //     required this.quantity,
  //     required this.unit,
  //     required this.description,
  //     required this.date});

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'projectId': projectId,
  //     'name': materialName,
  //     'quantity': quantity,
  //     'unit': unit,
  //     'description': description,
  //     'date': date,
  //   };
  // }

  // factory MaterialModel.fromMap(Map<String, dynamic> map) {
  //   return MaterialModel(
  //     id: map['_id'],
  //     projectId: map['projectId'] != null ? map['projectId'] as String : null,
  //     materialName: map['name'] as String,
  //     quantity: (map['quantity'] as num).toString(),
  //     unit: map['unit'] as String,
  //     description: map['description'] as String,
  //     date: map['date'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory MaterialModel.fromJson(String source) =>
  //     MaterialModel.fromMap(json.decode(source) as Map<String, dynamic>);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'partieId': partieId,
      'projectId': projectId,
      'name': name,
      'quantity': quantity,
      'priceperunit': priceperunit,
      'unit': unit,
      'description': description,
      'date': date,
      'hsncode': hsncode,
      'gst': gst,
    };
  }

  factory MaterialModel.fromMap(Map<String, dynamic> map) {
    return MaterialModel(
      id: map['_id'] != null ? map['_id'] as String : null,
      partieId: map['partieId'] != null ? map['partieId'] as String : null,
      projectId: map['projectId'] != null ? map['projectId'] as String : null,
      name: map['name'] as String,
      quantity: map['quantity'] as String,
      priceperunit: map['priceperunit'] as String,
      unit: map['unit'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      hsncode: map['hsncode'] != null ? map['hsncode'] as String : null,
      gst: map['gst'] != null ? map['gst'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MaterialModel.fromJson(String source) =>
      MaterialModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
