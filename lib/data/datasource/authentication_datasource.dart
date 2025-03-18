import 'dart:convert';

import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/utilities/dio_config/base_data_center.dart';
import 'package:injectable/injectable.dart';

abstract class AuthenticationDatasource {
  Future<int> isUserExist({required String email});

  Future<bool> verifyOtp({required String email, required String otp});

  Future<String> signUp(
      {required String companyName,
      required String email,
      required String password});

  Future<String> signIn({required String email, required String password});

  Future<String> forgotPasswordOtp({required String email});

  Future<bool> verifyEmail({required String email});

  Future<String> forgotPassword(
      {required String email, required String password});

  Future<bool> resetVerifyOtp({required String email, required String otp});
}

@LazySingleton(as: AuthenticationDatasource)
class AuthenticationDatasourceImpl extends AuthenticationDatasource {
  final dio = BaseDataCenter().dio.dio;
  @override
  Future<int> isUserExist({required String email}) async {
    try {
      final response = await dio.post(
        API.REQUEST_OTP,
        data: jsonEncode({"Email": email}),
      );
      print("---------------- ${response.statusCode}-----------------");
      if (response.statusCode == 200) {
        final data = response.data;
        // print("--------------------- $data -------------------");
        if (data["isVerified"] && data["isAccountCreate"]) {
          return 0;
        } else if (data["isVerified"] && !data["isAccountCreate"]) {
          return 1;
        }
        return 2;
      }
      return 3;
    } catch (e) {
      print("-----------------  -----$e- -----------");
      rethrow;
    }
  }

  @override
  Future<bool> verifyOtp({required String email, required String otp}) async {
    try {
      final response = await dio.post(
        API.VERIFY_OTP,
        data: jsonEncode({"Email": email, "otp": otp}),
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
      final response = await dio.post(
        API.SIGN_UP_API,
        data: jsonEncode(
            {"CompanyName": companyName, "Email": email, "Password": password}),
      );
      final res = jsonDecode(response.data);
      print("------------------------- $res ----------------------");
      return res["message"];
    } catch (e) {
      print(e.toString());
    }
    return "false";
  }

  @override
  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      final res = await dio.post(
        API.LOGIN_API,
        data: jsonEncode({"Email": email, "Password": password}),
      );

      print("--------- signin ${res.data} ----------");

      final data = res.data;
      return data['token'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> forgotPasswordOtp({required String email}) async {
    try {
      final res = await dio.post(API.FORGOT_PASSWORD_EMAIL,
          data: jsonEncode({"Email": email}));

      return "Forgot password otp sent successfully";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> verifyEmail({required String email}) async {
    try {
      final res = await dio.post(API.EMAIL_VERIFICATION,
          data: jsonEncode({'Email': email}));

      return res.data['isVerified'];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> forgotPassword(
      {required String email, required String password}) async {
    try {
      final res = await dio.post(API.FORGOT_PASSWORD,
          data: jsonEncode({'Email': email, 'Password': password}));

      return "Password reset successfully";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> resetVerifyOtp(
      {required String email, required String otp}) async {
    try {
      final res = await dio.post(API.RESET_VERIFY_OTP,
          data: jsonEncode({'Email': email, 'otp': otp}));

      return res.data["status"];
    } catch (e) {
      rethrow;
    }
  }
}
