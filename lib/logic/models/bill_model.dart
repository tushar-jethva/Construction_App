class BillModel {
  String? sId;
  PartieId? partieId;
  String? date;
  List<Items>? items;
  int? netAmount;
  int? totalAmount;
  int? receivableAmount;
  int? sGST;
  int? sGSTAmount;
  int? cGST;
  int? cGSTAmount;
  int? tDS;
  int? tDSAmount;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BillModel(
      {this.sId,
      this.partieId,
      this.date,
      this.items,
      this.netAmount,
      this.totalAmount,
      this.receivableAmount,
      this.sGST,
      this.sGSTAmount,
      this.cGST,
      this.cGSTAmount,
      this.tDS,
      this.tDSAmount,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  BillModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    partieId = json['PartieId'] != null
        ? new PartieId.fromJson(json['PartieId'])
        : null;
    date = json['date'];
    if (json['Items'] != null) {
      items = <Items>[];
      json['Items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    netAmount = json['NetAmount'];
    totalAmount = json['TotalAmount'];
    receivableAmount = json['ReceivableAmount'];
    sGST = json['SGST'];
    sGSTAmount = json['SGSTAmount'];
    cGST = json['CGST'];
    cGSTAmount = json['CGSTAmount'];
    tDS = json['TDS'];
    tDSAmount = json['TDSAmount'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.partieId != null) {
      data['PartieId'] = this.partieId!.toJson();
    }
    data['date'] = this.date;
    if (this.items != null) {
      data['Items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['NetAmount'] = this.netAmount;
    data['TotalAmount'] = this.totalAmount;
    data['ReceivableAmount'] = this.receivableAmount;
    data['SGST'] = this.sGST;
    data['SGSTAmount'] = this.sGSTAmount;
    data['CGST'] = this.cGST;
    data['CGSTAmount'] = this.cGSTAmount;
    data['TDS'] = this.tDS;
    data['TDSAmount'] = this.tDSAmount;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class PartieId {
  String? sId;
  String? name;
  String? projectId;
  String? email;
  String? contactNumber;
  String? shippingAddress;
  String? billingAddress;
  int? receivableAmount;
  int? receivedAmount;
  String? gSTnumber;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;

  PartieId(
      {this.sId,
      this.name,
      this.projectId,
      this.email,
      this.contactNumber,
      this.shippingAddress,
      this.billingAddress,
      this.receivableAmount,
      this.receivedAmount,
      this.gSTnumber,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  PartieId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    projectId = json['ProjectId'];
    email = json['Email'];
    contactNumber = json['ContactNumber'];
    shippingAddress = json['ShippingAddress'];
    billingAddress = json['BillingAddress'];
    receivableAmount = json['ReceivableAmount'];
    receivedAmount = json['ReceivedAmount'];
    gSTnumber = json['GSTnumber'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['ProjectId'] = this.projectId;
    data['Email'] = this.email;
    data['ContactNumber'] = this.contactNumber;
    data['ShippingAddress'] = this.shippingAddress;
    data['BillingAddress'] = this.billingAddress;
    data['ReceivableAmount'] = this.receivableAmount;
    data['ReceivedAmount'] = this.receivedAmount;
    data['GSTnumber'] = this.gSTnumber;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Items {
  String? hSNCode;
  String? description;
  int? amount;
  int? rate;
  int? squreFeet;
  String? sId;

  Items(
      {this.hSNCode,
      this.description,
      this.amount,
      this.rate,
      this.squreFeet,
      this.sId});

  Items.fromJson(Map<String, dynamic> json) {
    hSNCode = json['HSNCode'];
    description = json['Description'];
    amount = json['Amount'];
    rate = json['Rate'];
    squreFeet = json['SqureFeet'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['HSNCode'] = this.hSNCode;
    data['Description'] = this.description;
    data['Amount'] = this.amount;
    data['Rate'] = this.rate;
    data['SqureFeet'] = this.squreFeet;
    data['_id'] = this.sId;
    return data;
  }
}
