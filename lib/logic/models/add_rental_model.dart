import 'dart:convert';

class AddRentalModel {
  String? name;
  String? description;
  String? quantity;
  String? partieId;
  String? priceperunit;
  String? unit;
  String? projectId;
  String? date;
  String? startDate;
  String? endDate;
  String? id;

  AddRentalModel(
      {this.name,
      this.description,
      this.quantity,
      this.partieId,
      this.priceperunit,
      this.unit,
      this.projectId,
      this.date,
      this.startDate,
      this.endDate,
      this.id});

  AddRentalModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    partieId = json['partieId'];
    priceperunit = json['priceperunit'];
    unit = json['unit'];
    projectId = json['projectId'];
    date = json['date'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['partieId'] = this.partieId;
    data['priceperunit'] = this.priceperunit;
    data['unit'] = this.unit;
    data['projectId'] = this.projectId;
    data['date'] = this.date;
    data['_id'] = this.id;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    return data;
  }

  String toJson() => json.encode(toMap());
}
