import 'dart:convert';

import 'package:construction_mate/core/constants/api.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationDatasource {
  Future<bool> isUserExist({required String email});

  Future<bool> verifyOtp({required String email, required String otp});

  Future<String> signUp(
      {required String companyName,
      required String email,
      required String password});
}

class AuthenticationDatasourceImpl extends AuthenticationDatasource {
  @override
  Future<bool> isUserExist({required String email}) async {
    try {
      final response = await http.post(
        Uri.parse(API.REQUEST_OTP),
        body: jsonEncode({"Email": email}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print("---------------- ${response.statusCode}-----------------");
      if (response.statusCode == 200) {
        return false;
      }
      return true;
    } catch (e) {
      print("-----------------  $e -----------------");
    }
    return true;
  }

  @override
  Future<bool> verifyOtp({required String email, required String otp}) async {
    try {
      final response = await http.post(
        Uri.parse(API.VERIFY_OTP),
        body: jsonEncode({"Email": email, "otp": otp}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print(e.toString());
    }
    return false;
  }

  @override
  Future<String> signUp(
      {required String companyName,
      required String email,
      required String password}) async {
    try {
      final response = await http.post(
        Uri.parse(API.SIGN_UP_API),
        body: jsonEncode(
            {"CompanyName": companyName, "Email": email, "Password": password}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      final res = jsonDecode(response.body);
      print("------------------------- $res ----------------------");
      return res["message"];
    } catch (e) {
      print(e.toString());
    }
    return "false";
  }
}
