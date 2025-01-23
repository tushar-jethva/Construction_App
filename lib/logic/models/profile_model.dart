class ProfileModel {
  String? sId;
  String? email;
  bool? isEmailVerified;
  int? otp;
  bool? isPremium;
  bool? freeTrialStatus;
  bool? isDeleted;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? freeTrialEndDate;
  String? registerDate;
  String? name;
  String? password;
  String? gSTNumber;
  int? mobile;
  String? logo;

  ProfileModel(
      {this.sId,
      this.email,
      this.isEmailVerified,
      this.otp,
      this.isPremium,
      this.freeTrialStatus,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.freeTrialEndDate,
      this.registerDate,
      this.name,
      this.password,
      this.gSTNumber,
      this.mobile,
      this.logo});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['Email'];
    isEmailVerified = json['isEmailVerified'];
    otp = json['otp'];
    isPremium = json['isPremium'];
    freeTrialStatus = json['FreeTrialStatus'];
    isDeleted = json['isDeleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    freeTrialEndDate = json['FreeTrialEndDate'];
    registerDate = json['RegisterDate'];
    name = json['Name'];
    password = json['Password'];
    gSTNumber = json['GSTNumber'];
    mobile = json['Mobile'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Email'] = this.email;
    data['isEmailVerified'] = this.isEmailVerified;
    data['otp'] = this.otp;
    data['isPremium'] = this.isPremium;
    data['FreeTrialStatus'] = this.freeTrialStatus;
    data['isDeleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['FreeTrialEndDate'] = this.freeTrialEndDate;
    data['RegisterDate'] = this.registerDate;
    data['Name'] = this.name;
    data['Password'] = this.password;
    data['GSTNumber'] = this.gSTNumber;
    data['Mobile'] = this.mobile;
    data['logo'] = this.logo;
    return data;
  }
}
