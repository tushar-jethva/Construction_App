import 'package:construction_mate/data/datasource/authentication_datasource.dart';

abstract class AuthenticationRepository {
  Future<bool> isUserExist({required String email});

  Future<bool> verifyOtp({required String email, required String otp});

  Future<String> signUp(
      {required String companyName,
      required String email,
      required String password});
}

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl(this.datasource);
  final AuthenticationDatasource datasource;
  @override
  Future<bool> isUserExist({required String email}) async {
    final response = datasource.isUserExist(email: email);
    return response;
  }

  @override
  Future<bool> verifyOtp({required String email, required String otp}) async {
    return await datasource.verifyOtp(email: email, otp: otp);
  }

  @override
  Future<String> signUp(
      {required String companyName,
      required String email,
      required String password}) async {
    try {
      final response = await datasource.signUp(
          companyName: companyName, email: email, password: password);
      return response;
    } catch (e) {
      print(e.toString());
    }
    return "false";
  }
}
