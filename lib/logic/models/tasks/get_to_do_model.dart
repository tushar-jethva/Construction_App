class GetTodoModel {
  String? workName;
  List<Assignee>? assignee;
  String? status;
  String? sId;
  String? createdAt;
  String? updatedAt;

  GetTodoModel(
      {this.workName,
      this.assignee,
      this.status,
      this.sId,
      this.createdAt,
      this.updatedAt});

  GetTodoModel.fromJson(Map<String, dynamic> json) {
    workName = json['work_name'] ?? '';
    if (json['assignee'] != null) {
      assignee = <Assignee>[];
      json['assignee'].forEach((v) {
        assignee!.add(new Assignee.fromJson(v));
      });
    }
    status = json['status'] ?? '';
    sId = json['_id'] ?? '';
    createdAt = json['createdAt'] ?? '';
    updatedAt = json['updatedAt'] ?? '';
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
  String? sId;
  String? name;
  String? email;
  String? contactNumber;

  Assignee({this.sId, this.name, this.email, this.contactNumber});

  Assignee.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '';
    name = json['Name'] ?? '';
    email = json['Email'] ?? '';
    contactNumber = json['ContactNumber'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['ContactNumber'] = this.contactNumber;
    return data;
  }
}
