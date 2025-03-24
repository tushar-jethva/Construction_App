class AllMaterialModel {
  bool? status;
  int? totalProjectMaterialCost;
  int? totalProjectMaterialPaidCost;
  List<Data>? data;

  AllMaterialModel(
      {this.status,
      this.totalProjectMaterialCost,
      this.totalProjectMaterialPaidCost,
      this.data});

  AllMaterialModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalProjectMaterialCost = json['totalProjectMaterialCost'];
    totalProjectMaterialPaidCost = json['totalProjectMaterialPaidCost'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach(
        (v) {
          data!.add(Data.fromJson(v));
        },
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalProjectMaterialCost'] = this.totalProjectMaterialCost;
    data['totalProjectMaterialPaidCost'] = this.totalProjectMaterialPaidCost;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  List<Rentals>? rentals;
  int? totalCost;
  int? paidCost;
  String? sId;
  String? name;
  String? agencyType;
  String? contactNumber;
  String? email;

  Data(
      {this.rentals,
      this.totalCost,
      this.paidCost,
      this.sId,
      this.name,
      this.agencyType,
      this.contactNumber,
      this.email});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['rentals'] != null) {
      rentals = <Rentals>[];
      json['rentals'].forEach((v) {
        rentals!.add(Rentals.fromJson(v));
      });
    }
    totalCost = json['totalCost'];
    paidCost = json['paidCost'];
    sId = json['_id'];
    name = json['Name'];
    agencyType = json['agencyType'];
    contactNumber = json['ContactNumber'];
    email = json['Email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rentals != null) {
      data['rentals'] = this.rentals!.map((v) => v.toJson()).toList();
    }
    data['totalCost'] = this.totalCost;
    data['paidCost'] = this.paidCost;
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['agencyType'] = this.agencyType;
    data['ContactNumber'] = this.contactNumber;
    data['Email'] = this.email;
    return data;
  }
}

class Rentals {
  String? name;
  int? totalQuantity;
  int? totalPrice;
  List<Details>? details;

  Rentals({this.name, this.totalQuantity, this.totalPrice, this.details});

  Rentals.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    totalQuantity = json['totalQuantity'];
    totalPrice = json['totalPrice'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['totalQuantity'] = this.totalQuantity;
    data['totalPrice'] = this.totalPrice;
    if (this.details != null) {
      data['details'] = this.details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  String? materialId;
  String? name;
  int? quantity;
  int? priceperunit;
  int? totalPrice;
  String? unit;
  String? date;
  String? description;

  Details(
      {this.materialId,
      this.name,
      this.quantity,
      this.priceperunit,
      this.totalPrice,
      this.unit,
      this.date,
      this.description});

  Details.fromJson(Map<String, dynamic> json) {
    materialId = json['materialId'];
    name = json['name'];
    quantity = json['quantity'];
    priceperunit = json['priceperunit'];
    totalPrice = json['totalPrice'];
    unit = json['unit'];
    date = json['date'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['materialId'] = this.materialId;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['priceperunit'] = this.priceperunit;
    data['totalPrice'] = this.totalPrice;
    data['unit'] = this.unit;
    data['date'] = this.date;
    data['description'] = this.description;
    return data;
  }
}
