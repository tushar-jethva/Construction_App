class BillingPartyModel {
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
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  BillingPartyModel(
      {this.name,
      this.projectId,
      this.email,
      this.contactNumber,
      this.shippingAddress,
      this.billingAddress,
      this.receivableAmount,
      this.receivedAmount,
      this.gSTnumber,
      this.isDeleted,
      this.sId,
      this.createdAt,
      this.updatedAt,
      this.iV});

  BillingPartyModel.fromJson(Map<String, dynamic> json) {
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
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

    BillingPartyModel.fromJson2(Map<String, dynamic> json) {
    name = json['Name'];
    email = json['Email'];
    contactNumber = json['ContactNumber'];
    shippingAddress = json['ShippingAddress'];
    billingAddress = json['BillingAddress'];
    receivableAmount = (json['ReceivableAmount'] as dynamic).toString();
    receivedAmount = (json['ReceivedAmount'] as dynamic).toString();
    gSTnumber = json['GSTnumber'];
    isDeleted = json['isDeleted'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
