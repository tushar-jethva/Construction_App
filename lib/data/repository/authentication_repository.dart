import 'package:construction_mate/data/datasource/authentication_datasource.dart';
import 'package:construction_mate/utilities/error_handling/error_handler.dart';
import 'package:construction_mate/utilities/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class AuthenticationRepository {
  Future<int> isUserExist({required String email});

  Future<bool> verifyOtp({required String email, required String otp});

  Future<Either<Failure, String>> signUp(
      {required String companyName,
      required String email,
      required String password});

  Future<Either<Failure, String>> signIn(
      {required String email, required String password});
}

@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl(this.datasource);
  final AuthenticationDatasource datasource;
  @override
  Future<int> isUserExist({required String email}) async {
    final response = datasource.isUserExist(email: email);
    return response;
  }

  @override
  Future<bool> verifyOtp({required String email, required String otp}) async {
    return await datasource.verifyOtp(email: email, otp: otp);
  }

  @override
  Future<Either<Failure, String>> signUp(
      {required String companyName,
      required String email,
      required String password}) async {
    return handleErrors(() => datasource.signUp(
        companyName: companyName, email: email, password: password));
  }

  @override
  Future<Either<Failure, String>> signIn(
      {required String email, required String password}) async {
    return handleErrors(
        () => datasource.signIn(email: email, password: password));
  }
}
