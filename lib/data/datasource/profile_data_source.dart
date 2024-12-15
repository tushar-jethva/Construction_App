import 'dart:convert';

import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/fitler_option_model.dart';
import 'package:construction_mate/logic/models/gst_model.dart';
import 'package:construction_mate/logic/models/other_expense_model.dart';
import 'package:construction_mate/logic/models/others_transaction_data_model.dart';
import 'package:construction_mate/logic/models/tds_model.dart';
import 'package:construction_mate/utilities/dio_config/base_data_center.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileDataSource {
  Future<TdsModel?> fetchTdsDetails({String? year});

  Future<GstModel?> fetchGstDetails({String? year});

  Future<OtherExpenseModel?> fetchOtherExpenseDetails({String? year});

  Future<String> completeProfile(
      {required String email,
      required String gst,
      required String phoneNumber,
      required String imageUrl});
}

@LazySingleton(as: ProfileDataSource)
class ProfileDataSourceImpl implements ProfileDataSource {
  final dio = BaseDataCenter().dio.dio;

  @override
  Future<TdsModel?> fetchTdsDetails({String? year}) async {
    try {
      final res = await dio
          .get(API.GET_TDS_TRANSACTIONS, queryParameters: {"year": year});

      final data = res.data;

      final totalTds = data['data']['TotalTds'];
      List<OthersTransactionDataModel> tdsList = [];

      for (var transaction in data['data']['Transactions']) {
        tdsList.add(OthersTransactionDataModel.fromJson(transaction));
      }

      FilterOption filterOption = FilterOption(
          startYear: data['data']['FilterOption']['startYear'],
          endYear: data['data']['FilterOption']['endYear']);

      TdsModel tdsModel = TdsModel(
          totalTds: totalTds, tdsList: tdsList, fileterOption: filterOption);

      return tdsModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GstModel?> fetchGstDetails({String? year}) async {
    try {
      final res = await dio
          .get(API.GET_GST_TRANSACTIONS, queryParameters: {"year": year});

      final data = res.data;

      final totalGst = data['data']['TotalGst'];
      List<OthersTransactionDataModel> gstList = [];

      for (var transaction in data['data']['Transactions']) {
        gstList.add(OthersTransactionDataModel.fromJson(transaction));
      }

      FilterOption filterOption = FilterOption(
          startYear: data['data']['FilterOption']['startYear'],
          endYear: data['data']['FilterOption']['endYear']);

      GstModel gstModel = GstModel(
          totalGst: totalGst, gstList: gstList, fileterOption: filterOption);

      return gstModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<OtherExpenseModel?> fetchOtherExpenseDetails({String? year}) async {
    try {
      final res = await dio.get(API.GET_OTHER_EXPENSE_TRANSACTIONS,
          queryParameters: {"year": year});

      final data = res.data;

      debugPrint("------------ $data ------------");
      final totalExpense = data['data']['TotalOtherExpense'];
      List<OthersTransactionDataModel> otherExpenseList = [];

      for (var transaction in data['data']['Transactions']) {
        otherExpenseList.add(OthersTransactionDataModel.fromJson(transaction));
      }

      FilterOption filterOption = FilterOption(
          startYear: data['data']['FilterOption']['startYear'],
          endYear: data['data']['FilterOption']['endYear']);

      OtherExpenseModel otherExpenseModel = OtherExpenseModel(
          totalExpense: totalExpense,
          expenseList: otherExpenseList,
          fileterOption: filterOption);

      return otherExpenseModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> completeProfile(
      {required String email,
      required String gst,
      required String phoneNumber,
      required String imageUrl}) async {
    try {
      final res = await dio.post(API.COMPLETE_PROFILE,
          data: jsonEncode({
            "GSTNumber": gst,
            "Mobile": phoneNumber,
            "Email": email,
            'logo': imageUrl
          }));

      return res.data['message'];
    } catch (e) {
      rethrow;
    }
  }
}
