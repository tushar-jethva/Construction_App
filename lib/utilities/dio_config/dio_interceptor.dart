import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/presentation/router/go_router.dart';
import 'package:construction_mate/utilities/shared_preference_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DioAuthInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print("Hello request");
    Connectivity().checkConnectivity().then((value) async {
      if (value.contains(ConnectivityResult.wifi) ||
          value.contains(ConnectivityResult.mobile)) {
        // Set Content-Type header
        options.headers['Content-Type'] = 'application/json; charset=UTF-8';
        String? token = SharedPreferenceHelper().getdata("token");
        if (token != null && token.isNotEmpty) {
          options.headers['authorization'] = 'Bearer $token';
          debugPrint(token);
        }
        handler.next(options);
      }
    });
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    print(err.response);
    //401 unAuthorized Account Access ! [Third party unAuthorized Account Access]
    //402 planUpgrade need!
    //404 Data Not exits !
    //409 Data Already exits !
    //422 Invalid Input Data !
    //426 Upgrade Required !
    //500 Something went wrong !
    if (err.response!.statusCode == 409) {
      // Get.dialog(ErrorHandlingDialog(
      //   errorTitle: "Data Already exits !",
      //   responseCode: err.response!.statusCode!,
      //   responseMessage: err.response!.data['error'],
      // ));
    } else if (err.response!.statusCode == 422) {
      // Get.dialog(
      //     ErrorHandlingDialog(
      //       errorTitle: "Invalid Input Data !",
      //       responseCode: err.response!.statusCode!,
      //       responseMessage: err.response!.data['error'],
      //     ),
      //     barrierDismissible: true);
    } else if (err.response!.statusCode == 401) {
      // Get.dialog(ErrorHandlingDialog(
      //   errorTitle: "To perform this action you need to login.",
      //   responseCode: err.response!.statusCode!,
      //   responseMessage: err.response!.data['error'],
      // ));
    } else if (err.response!.statusCode == 402) {
      // Get.dialog(ErrorHandlingDialog(
      //   errorTitle: "Need to upgrade plan",
      //   responseCode: err.response!.statusCode!,
      //   responseMessage: err.response!.data['error'],
      // ));
    } else if (err.response!.statusCode == 403) {
      print("------------- token expired -----------------");
      Routes.routes.goNamed(RoutesName.signInScreen);
      // navigatorKey.currentState?.pushReplacementNamed(RoutesName.signInScreen);
    } else if (err.response!.statusCode != 200 &&
        err.response!.statusCode != 404) {
      // Get.dialog(ErrorHandlingDialog(
      //   errorTitle: "Something went wrong!",
      //   responseCode: err.response!.statusCode!,
      //   responseMessage: err.response!.data['error'],
      // ));
    }
  }
}
