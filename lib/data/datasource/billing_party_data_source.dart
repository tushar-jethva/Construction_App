import 'dart:convert';

import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';
import 'package:construction_mate/utilities/dio_config/base_data_center.dart';
import 'package:flutter/material.dart';

abstract class BillingPartyDataSource {
  Future<void> addBillingParty(
      {required String projectId,
      required String partyName,
      required String gstNo,
      required String email,
      required String contactNo,
      required String shippingAddress,
      required String billingAddress});

  Future<List<AgencyModel>> getAllParties();

  Future<List<AgencyModel>> getAllPartiesByProject({required String projectId});
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
      AgencyModel billingPartyModel = AgencyModel(
          projectId: ProjectId(sId: projectId),
          name: partyName,
          gSTNumber: gstNo,
          email: email,
          contactNumber: contactNo,
          shippingAddress: shippingAddress,
          billingAddress: billingAddress,
          agencyType: 'Investor');

      final res = await dio.post(
        API.ADD_PARTY,
        data: jsonEncode(billingPartyModel.toJson()),
      );

      debugPrint(
          "===================================== res: ${res.data} =====================================");
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<AgencyModel>> getAllParties() async {
    List<AgencyModel> billingParties = [];
    try {
      final res = await dio.get(API.GET_ALL_PARTIES);

      final parties = res.data;

      debugPrint("=========== all parites ${parties} ========");
      for (var party in parties["data"]) {
        billingParties.add(AgencyModel.fromJson(party));
      }
    } catch (e) {
      print(e.toString());
    }
    return billingParties;
  }

  @override
  Future<List<AgencyModel>> getAllPartiesByProject(
      {required String projectId}) async {
    List<AgencyModel> billingParties = [];
    try {
      final res = await dio.get("${API.GET_ALL_PARTIES_BY_PROJECT}/$projectId");

      final parties = res.data;

      for (var party in parties["data"]) {
        billingParties.add(AgencyModel.fromJson(party));
      }
    } catch (e) {
      print(e.toString());
    }
    return billingParties;
  }
}
