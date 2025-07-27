// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UpdateTaskModel {
  final String? status;
  final num? progress;
  final String? est_qty;

  UpdateTaskModel({this.status, this.progress, this.est_qty});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'progress': progress,
      'est_qty': est_qty,
    };
  }

  factory UpdateTaskModel.fromMap(Map<String, dynamic> map) {
    return UpdateTaskModel(
      status: map['status'] != null ? map['status'] as String : null,
      progress: map['progress'] != null ? map['progress'] as num : null,
      est_qty: map['est_qty'] != null ? map['est_qty'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateTaskModel.fromJson(String source) =>
      UpdateTaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
