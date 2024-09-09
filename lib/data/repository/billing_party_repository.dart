import 'package:construction_mate/data/datasource/billing_party_data_source.dart';

abstract class BillingPartyRepository {
  void addBillingParty(
      {required String projectId,
      required String partyName,
      required String gstNo,
      required String email,
      required String contactNo,
      required String shippingAddress,
      required String billingAddress});
}

class BillingRepositoryImpl extends BillingPartyRepository {
  final BillingPartyDataSource billingPartyDataSource = BillingPartyImpl();
  @override
  void addBillingParty(
      {required String projectId,
      required String partyName,
      required String gstNo,
      required String email,
      required String contactNo,
      required String shippingAddress,
      required String billingAddress}) async {
    try {
      billingPartyDataSource.addBillingParty(
          projectId: projectId,
          partyName: partyName,
          gstNo: gstNo,
          email: email,
          contactNo: contactNo,
          shippingAddress: shippingAddress,
          billingAddress: billingAddress);
    } catch (e) {
      print(e.toString());
    }
  }
}
