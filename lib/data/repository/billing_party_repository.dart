import 'package:construction_mate/data/datasource/billing_party_data_source.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/billing_party_model.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class BillingPartyRepository {
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

@LazySingleton(as: BillingPartyRepository)
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
  Future<List<AgencyModel>> getAllParties() async {
    List<AgencyModel> billingItems = [];
    try {
      billingItems = await billingPartyDataSource.getAllParties();
    } catch (e) {
      print(e.toString());
    }
    return billingItems;
  }

  @override
  Future<List<AgencyModel>> getAllPartiesByProject(
      {required String projectId}) async {
    List<AgencyModel> billingItems = [];
    try {
      billingItems = await billingPartyDataSource.getAllPartiesByProject(
          projectId: projectId);

      debugPrint("============ listin repository $billingItems ==============");
    } catch (e) {
      print(e.toString());
    }
    return billingItems;
  }
}
