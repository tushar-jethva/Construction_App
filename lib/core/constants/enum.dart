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
  Agency,
  BillingParty,
  Material,
  none,
  Vendor;

  bool get isAgency => this == PartyType.Agency;
  bool get isBillingParty => this == PartyType.BillingParty;
  bool get isMaterial => this == PartyType.Material;
  bool get isVendor => this == PartyType.Vendor;
}
