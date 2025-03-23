// ignore_for_file: public_member_api_docs, sort_constructors_first
class BillModel {
  String? sId;
  PartieId? partieId;
  String? date;
  List<Items>? items;
  MoreDetails? moreDetails;
  String? netAmount;
  String? totalAmount;
  String? receivableAmount;
  String? billNumber;
  String? sGST;
  String? sGSTAmount;
  String? cGST;
  String? cGSTAmount;
  String? tDS;
  String? tDSAmount;
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
      this.billNumber,
      this.sGST,
      this.sGSTAmount,
      this.cGST,
      this.cGSTAmount,
      this.tDS,
      this.tDSAmount,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.moreDetails,
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
    moreDetails = json['MoreDetails'] != null
        ? MoreDetails.fromJson(json['MoreDetails'])
        : null;
    billNumber = json["BillNumber"];
    netAmount = (json['NetAmount'] as dynamic).toString();
    totalAmount = (json['TotalAmount'] as dynamic).toString();
    receivableAmount = (json['ReceivableAmount'] as dynamic).toString();
    sGST = (json['SGST'] as dynamic).toString();
    sGSTAmount = (json['SGSTAmount'] as dynamic).toString();
    cGST = (json['CGST'] as dynamic).toString();
    cGSTAmount = (json['CGSTAmount'] as dynamic).toString();
    tDS = (json['TDS'] as dynamic).toString();
    tDSAmount = (json['TDSAmount'] as dynamic).toString();
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
  String? receivableAmount;
  String? receivedAmount;
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
    receivableAmount = (json['ReceivableAmount'] as dynamic).toString();
    receivedAmount = (json['ReceivedAmount'] as dynamic).toString();
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
  String? amount;
  String? rate;
  int? squreFeet;
  String? sId;
  String? per;

  Items(
      {this.hSNCode,
      this.description,
      this.amount,
      this.rate,
      this.squreFeet,
      this.sId,
      this.per});

  Items.fromJson(Map<String, dynamic> json) {
    hSNCode = json['HSNCode'];
    description = json['Description'];
    amount = (json['Amount'] as dynamic).toString();
    rate = (json['Rate'] as dynamic).toString();
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

class MoreDetails {
  String? deliveryNote;
  String? modeOfPayment;
  String? referenceNo;
  String? otherReferences;
  String? buyersOrderNo;
  String? dispatchDocNo;
  String? dispatchedThrough;
  String? destination;

  MoreDetails(
      {this.deliveryNote,
      this.modeOfPayment,
      this.referenceNo,
      this.otherReferences,
      this.buyersOrderNo,
      this.dispatchDocNo,
      this.dispatchedThrough,
      this.destination});

  MoreDetails.fromJson(Map<String, dynamic> json) {
    deliveryNote = json['deliveryNote'];
    modeOfPayment = json['modeOfPayment'];
    referenceNo = json['referenceNo'];
    otherReferences = json['otherReferences'];
    buyersOrderNo = json['buyersOrderNo'];
    dispatchDocNo = json['dispatchDocNo'];
    dispatchedThrough = json['dispatchedThrough'];
    destination = json['destination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deliveryNote'] = this.deliveryNote;
    data['modeOfPayment'] = this.modeOfPayment;
    data['referenceNo'] = this.referenceNo;
    data['otherReferences'] = this.otherReferences;
    data['buyersOrderNo'] = this.buyersOrderNo;
    data['dispatchDocNo'] = this.dispatchDocNo;
    data['dispatchedThrough'] = this.dispatchedThrough;
    data['destination'] = this.destination;
    return data;
  }
}
