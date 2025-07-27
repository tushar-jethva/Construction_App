// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CreateTaskModel {
  final String? projectId;
  final String taskName;
  final String duration;
  final String startDate;
  final String progressUnit;
  final String estQuanitity;
  final List<String> assignees;

  CreateTaskModel(
      {required this.taskName,
      this.projectId,
      required this.duration,
      required this.startDate,
      required this.progressUnit,
      required this.estQuanitity,
      required this.assignees});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'project_id': projectId,
      'name': taskName,
      'duration': duration,
      'start_date': startDate,
      'unit': progressUnit,
      'est_qty': estQuanitity,
      'assignee': assignees,
    };
  }

  factory CreateTaskModel.fromMap(Map<String, dynamic> map) {
    return CreateTaskModel(
      taskName: map['name'] ?? '',
      duration: map['duration'] as String,
      startDate: map['startDate'] as String,
      progressUnit: map['progressUnit'] as String,
      estQuanitity: map['estQuanitity'] as String,
      assignees: List<String>.from((map['assignees'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateTaskModel.fromJson(String source) =>
      CreateTaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
