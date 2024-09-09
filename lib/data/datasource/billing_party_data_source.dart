import 'dart:convert';

import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';
import 'package:http/http.dart' as http;

abstract class BillingPartyDataSource {
  void addBillingParty(
      {required String projectId,
      required String partyName,
      required String gstNo,
      required String email,
      required String contactNo,
      required String shippingAddress,
      required String billingAddress});
}

class BillingPartyImpl extends BillingPartyDataSource {
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
      BillingPartyModel billingPartyModel = BillingPartyModel(
          projectId: projectId,
          name: partyName,
          gSTnumber: gstNo,
          email: email,
          contactNumber: contactNo,
          shippingAddress: shippingAddress,
          billingAddress: billingAddress);

      await http.post(
        Uri.parse(API.ADD_BILLING_PARTY),
        body:  jsonEncode(billingPartyModel.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
