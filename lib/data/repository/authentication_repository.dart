import 'package:construction_mate/data/datasource/authentication_datasource.dart';
import 'package:construction_mate/utilities/error_handling/error_handler.dart';
import 'package:construction_mate/utilities/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class AuthenticationRepository {
  Future<int> isUserExist({required String email});

  Future<Either<Failure, bool>> verifyOtp(
      {required String email, required String otp});

  Future<Either<Failure, String>> signUp(
      {required String companyName,
      required String email,
      required String password});

  Future<Either<Failure, String>> signIn(
      {required String email, required String password});

  Future<Either<Failure, String>> forgotPasswordOtp({required String email});

  Future<Either<Failure, bool>> verifyEmail({required String email});

  Future<Either<Failure, String>> forgotPassword(
      {required String email, required String password});

  Future<Either<Failure, bool>> resetVerifyOtp(
      {required String email, required String otp});
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
  Future<Either<Failure, bool>> verifyOtp(
      {required String email, required String otp}) async {
    return handleErrors(() => datasource.verifyOtp(email: email, otp: otp));
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

  @override
  Future<Either<Failure, String>> forgotPasswordOtp(
      {required String email}) async {
    return handleErrors(() => datasource.forgotPasswordOtp(email: email));
  }

  @override
  Future<Either<Failure, bool>> verifyEmail({required String email}) {
    return handleErrors(() => datasource.verifyEmail(email: email));
  }

  @override
  Future<Either<Failure, String>> forgotPassword(
      {required String email, required String password}) {
    return handleErrors(
        () => datasource.forgotPassword(email: email, password: password));
  }

  @override
  Future<Either<Failure, bool>> resetVerifyOtp(
      {required String email, required String otp}) {
    return handleErrors(
        () => datasource.resetVerifyOtp(email: email, otp: otp));
  }
}
