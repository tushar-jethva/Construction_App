class RentalModel {
  bool? status;
  num? totalProjectRentalCost;
  num? totalProjectRentalPaidCost;
  List<Data>? data;

  RentalModel(
      {this.status,
      this.totalProjectRentalCost,
      this.totalProjectRentalPaidCost,
      this.data});

  RentalModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalProjectRentalCost = json['totalProjectRentalCost'];
    totalProjectRentalPaidCost = json['totalProjectRentalPaidCost'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalProjectRentalCost'] = this.totalProjectRentalCost;
    data['totalProjectRentalPaidCost'] = this.totalProjectRentalPaidCost;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  List<Rentals>? rentals;
  num? totalCost;
  num? paidCost;
  String? sId;
  String? name;
  String? agencyType;
  String? contactNumber;
  String? gSTNumber;
  String? email;

  Data(
      {this.rentals,
      this.totalCost,
      this.paidCost,
      this.sId,
      this.name,
      this.agencyType,
      this.contactNumber,
      this.gSTNumber,
      this.email});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['rentals'] != null) {
      rentals = <Rentals>[];
      json['rentals'].forEach((v) {
        rentals!.add(new Rentals.fromJson(v));
      });
    }
    totalCost = json['totalCost'];
    paidCost = json['paidCost'];
    sId = json['_id'];
    name = json['Name'];
    agencyType = json['agencyType'];
    contactNumber = json['ContactNumber'];
    gSTNumber = json['GSTNumber'];
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
    data['GSTNumber'] = this.gSTNumber;
    data['Email'] = this.email;
    return data;
  }
}

class Rentals {
  String? name;
  num? totalQuantity;
  num? totalPrice;
  List<Details>? details;

  Rentals({this.name, this.totalQuantity, this.totalPrice, this.details});

  Rentals.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    totalQuantity = json['totalQuantity'];
    totalPrice = json['totalPrice'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(new Details.fromJson(v));
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
  String? rentalId;
  String? name;
  num? quantity;
  num? priceperunit;
  num? totalPrice;
  String? unit;
  String? date;
  String? description;

  Details(
      {this.rentalId,
      this.name,
      this.quantity,
      this.priceperunit,
      this.totalPrice,
      this.unit,
      this.date,
      this.description});

  Details.fromJson(Map<String, dynamic> json) {
    rentalId = json['rentalId'];
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
    data['rentalId'] = this.rentalId;
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
