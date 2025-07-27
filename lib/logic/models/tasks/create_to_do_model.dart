// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CreateToDoModel {
  final String name;
  final List<String> assignees;

  CreateToDoModel({required this.name, required this.assignees});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'work_name': name,
      'assignee': assignees,
    };
  }

  factory CreateToDoModel.fromMap(Map<String, dynamic> map) {
    return CreateToDoModel(
      name: map['name'] as String,
      assignees: List<String>.from((map['assignees'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateToDoModel.fromJson(String source) =>
      CreateToDoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
