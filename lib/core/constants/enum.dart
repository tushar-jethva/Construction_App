// ignore_for_file: constant_identifier_names

enum RequestState {
  empty,
  loading,
  error,
  loaded;

  bool get isEmpty => this == RequestState.empty;
  bool get isLoading => this == RequestState.loading;
  bool get isLoaded => this == RequestState.loaded;
  bool get isError => this == RequestState.error;
}

enum PartyType {
  SubContractor('Labour'),
  BillingParty('Investor'),
  Material('Material supplier'),
  none(''),
  EquipmentSupplier('Equipment supplier'),
  ;

  final String apiValue;

  const PartyType(this.apiValue);

  @override
  String toString() => apiValue;

  bool get isAgency => this == PartyType.SubContractor;
  bool get isBillingParty => this == PartyType.BillingParty;
  bool get isMaterial => this == PartyType.Material;
  bool get isVendor => this == PartyType.EquipmentSupplier;
}

enum ForgotState {
  empty,
  emailVerificationLoading,
  emailVerified,
  emailNotVerified,
  emailVerificationFailed,
  otpSending,
  otpSentFailed,
  otpSent
}
