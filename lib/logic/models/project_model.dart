// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProjectModel {
  final String projectId;
  final String projectName;
  final String startDate;
  final String description;
  final double payIn;
  final double payOut;

  ProjectModel({
    required this.projectId,
    required this.projectName,
    required this.startDate,
    required this.description,
    required this.payIn,
    required this.payOut,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'projectId': projectId,
      'projectName': projectName,
      'startDate': startDate,
      'description': description,
      'payIn': payIn,
      'payOut': payOut,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      projectId: map['projectId'] as String,
      projectName: map['projectName'] as String,
      startDate: map['startDate'] as String,
      description: map['description'] as String,
      payIn: map['payIn'] as double,
      payOut: map['payOut'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) => ProjectModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
