class AgencyModel {
  String? sId;
  String? name;
  String? companyId;
  ProjectId? projectId;
  String? description;
  String? agencyType;
  List<String>? workType;
  String? email;
  String? contactNumber;
  String? shippingAddress;
  String? billingAddress;
  num? receivableAmount;
  num? receivedAmount;
  num? totalAmount;
  String? gSTNumber;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  num? iV;
  num? totalAccount;
  num? totalPayable;
  num? totalPaid;

  AgencyModel(
      {this.sId,
      this.name,
      this.companyId,
      this.projectId,
      this.description,
      this.agencyType,
      this.workType,
      this.email,
      this.contactNumber,
      this.shippingAddress,
      this.billingAddress,
      this.receivableAmount,
      this.receivedAmount,
      this.totalAmount,
      this.gSTNumber,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.totalAccount,
      this.totalPayable,
      this.totalPaid});

  AgencyModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '';
    name = json['Name'] ?? '';
    companyId = json['CompanyId'] ?? '';
    if (json['ProjectId'] is Map<String, dynamic>) {
      projectId = ProjectId.fromJson(json['ProjectId']);
    } else if (json['ProjectId'] is String) {
      projectId = ProjectId(
          sId: json[
              'ProjectId']); // Assuming ProjectId has a constructor accepting a String
    } else {
      projectId = null;
    }
    description = json['Description'] ?? '';
    agencyType = json['agencyType'] ?? '';
    workType = json['WorkType']?.cast<String>();
    email = json['Email'] ?? '';
    contactNumber = json['ContactNumber'] ?? '';
    shippingAddress = json['ShippingAddress'] ?? '';
    billingAddress = json['BillingAddress'] ?? '';
    receivableAmount = json['ReceivableAmount'] ?? 0;
    receivedAmount = json['ReceivedAmount'] ?? 0;
    totalAmount = json['TotalAmount'] ?? 0;
    gSTNumber = json['GSTNumber'] ?? '';
    isDeleted = json['isDeleted'] ?? false;
    createdAt = json['createdAt'] ?? '';
    updatedAt = json['updatedAt'] ?? '';
    iV = json['__v'] ?? 0;
    totalAccount = json['TotalAccount'] ?? 0;
    totalPayable = json['TotalPayable'] ?? 0;
    totalPaid = json['TotalPaid'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['CompanyId'] = this.companyId;
    if (this.projectId != null) {
      data['ProjectId'] = this.projectId!.toJson();
    }
    data['Description'] = this.description;
    data['agencyType'] = this.agencyType;
    data['WorkType'] = this.workType;
    data['Email'] = this.email;
    data['ContactNumber'] = this.contactNumber;
    data['ShippingAddress'] = this.shippingAddress;
    data['BillingAddress'] = this.billingAddress;
    data['ReceivableAmount'] = this.receivableAmount;
    data['ReceivedAmount'] = this.receivedAmount;
    data['TotalAmount'] = this.totalAmount;
    data['GSTNumber'] = this.gSTNumber;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['TotalAccount'] = this.totalAccount;
    data['TotalPayable'] = this.totalPayable;
    data['TotalPaid'] = this.totalPaid;
    return data;
  }
}

class ProjectId {
  String? sId;
  String? name;
  String? companyId;
  num? progress;
  String? description;
  num? paymentIn;
  num? paymentOut;
  String? startDate;
  String? endDate;
  String? address;
  num? totalBuilding;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  num? iV;

  ProjectId(
      {this.sId,
      this.name,
      this.companyId,
      this.progress,
      this.description,
      this.paymentIn,
      this.paymentOut,
      this.startDate,
      this.endDate,
      this.address,
      this.totalBuilding,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV});

  ProjectId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    companyId = json['CompanyId'];
    progress = json['progress'];
    description = json['Description'];
    paymentIn = json['PaymentIn'];
    paymentOut = json['PaymentOut'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    address = json['Address'];
    totalBuilding = json['TotalBuilding'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['CompanyId'] = this.companyId;
    data['progress'] = this.progress;
    data['Description'] = this.description;
    data['PaymentIn'] = this.paymentIn;
    data['PaymentOut'] = this.paymentOut;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['Address'] = this.address;
    data['TotalBuilding'] = this.totalBuilding;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
