import 'dart:convert';

import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';
import 'package:construction_mate/utilities/dio_config/base_data_center.dart';

abstract class BillingPartyDataSource {
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

class BillingPartyImpl extends BillingPartyDataSource {
  final dio = BaseDataCenter().dio.dio;

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
      BillingPartyModel billingPartyModel = BillingPartyModel(
          projectId: projectId,
          name: partyName,
          gSTnumber: gstNo,
          email: email,
          contactNumber: contactNo,
          shippingAddress: shippingAddress,
          billingAddress: billingAddress);

      await dio.post(
        API.ADD_BILLING_PARTY,
        data: jsonEncode(billingPartyModel.toJson()),
      );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<BillingPartyModel>> getAllParties() async {
    List<BillingPartyModel> billingParties = [];
    try {
      final res = await dio.get(API.GET_ALL_PARTIES);

      final parties = res.data;
      for (var party in parties["data"]) {
        billingParties.add(BillingPartyModel.fromJson2(party));
      }
    } catch (e) {
      print(e.toString());
    }
    return billingParties;
  }
}
