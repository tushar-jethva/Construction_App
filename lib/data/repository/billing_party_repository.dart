import 'package:construction_mate/data/datasource/billing_party_data_source.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';

abstract class BillingPartyRepository {
  Future<void> addBillingParty(
      {required String projectId,
      required String partyName,
      required String gstNo,
      required String email,
      required String contactNo,
      required String shippingAddress,
      required String billingAddress});

  Future<List<BillingPartyModel>> getAllParties();
}

class BillingRepositoryImpl extends BillingPartyRepository {
  final BillingPartyDataSource billingPartyDataSource = BillingPartyImpl();
  @override
  Future<void> addBillingParty(
      {required String projectId,
      required String partyName,
      required String gstNo,
      required String email,
      required String contactNo,
      required String shippingAddress,
      required String billingAddress}) async {
    try {
     await billingPartyDataSource.addBillingParty(
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

  @override
  Future<List<BillingPartyModel>> getAllParties() async {
    List<BillingPartyModel> billingItems = [];
    try {
      billingItems = await billingPartyDataSource.getAllParties();
    } catch (e) {
      print(e.toString());
    }
    return billingItems;
  }
}
