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
      this.id});

  AddRentalModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    partieId = json['partieId'];
    priceperunit = json['priceperunit'];
    unit = json['unit'];
    projectId = json['projectId'];
    date = json['date'];
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
    return data;
  }

  String toJson() => json.encode(toMap());
}
