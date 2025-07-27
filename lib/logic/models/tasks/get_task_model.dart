// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetTaskModel {
  String? sId;
  CompanyId? companyId;
  ProjectId? projectId;
  String? name;
  num? duration;
  String? startDate;
  String? endDate;
  String? unit;
  num? estQty;
  List<Assignee>? assignee;
  String? status;
  num? progress;
  List<Todos>? todos;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  GetTaskModel(
      {this.sId,
      this.companyId,
      this.projectId,
      this.name,
      this.duration,
      this.startDate,
      this.endDate,
      this.unit,
      this.estQty,
      this.assignee,
      this.status,
      this.progress,
      this.todos,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  GetTaskModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'] ?? '';
    duration = json['duration'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    unit = json['unit'];
    estQty = json['est_qty'];
    if (json['assignee'] != null) {
      assignee = <Assignee>[];
      json['assignee'].forEach((v) {
        assignee!.add(Assignee.fromMap(v));
      });
    }
    status = json['status'];
    progress = json['progress'];
    if (json['todos'] != null) {
      todos = <Todos>[];
      json['todos'].forEach((v) {
        todos!.add(new Todos.fromJson(v));
      });
    }
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.companyId != null) {
      data['CompanyId'] = this.companyId!.toJson();
    }
    if (this.projectId != null) {
      data['project_id'] = this.projectId!.toJson();
    }
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['unit'] = this.unit;
    data['est_qty'] = this.estQty;
    if (this.assignee != null) {
      data['assignee'] = this.assignee!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['progress'] = this.progress;
    if (this.todos != null) {
      data['todos'] = this.todos!.map((v) => v.toJson()).toList();
    }
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class CompanyId {
  String? sId;

  CompanyId({this.sId});

  CompanyId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    return data;
  }
}

class ProjectId {
  String? sId;
  String? name;

  ProjectId({this.sId, this.name});

  ProjectId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    return data;
  }
}

class Todos {
  String? workName;
  List<Assignee>? assignee;
  String? status;
  String? sId;
  String? createdAt;
  String? updatedAt;

  Todos(
      {this.workName,
      this.assignee,
      this.status,
      this.sId,
      this.createdAt,
      this.updatedAt});

  Todos.fromJson(Map<String, dynamic> json) {
    workName = json['work_name'];
    if (json['assignee'] != null) {
      assignee = <Assignee>[];
      json['assignee'].forEach((v) {
        assignee!.add(new Assignee.fromMap(v));
      });
    }
    status = json['status'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['work_name'] = this.workName;
    if (this.assignee != null) {
      data['assignee'] = this.assignee!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Assignee {
  final String name;
  final String id;

  Assignee({required this.name, required this.id});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
    };
  }

  factory Assignee.fromMap(Map<String, dynamic> map) {
    return Assignee(
      name: map['Name'] ?? '',
      id: map['_id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Assignee.fromJson(String source) =>
      Assignee.fromMap(json.decode(source) as Map<String, dynamic>);
}
