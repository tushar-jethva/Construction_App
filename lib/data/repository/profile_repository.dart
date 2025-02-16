import 'package:construction_mate/data/datasource/profile_data_source.dart';
import 'package:construction_mate/logic/models/gst_model.dart';
import 'package:construction_mate/logic/models/other_expense_model.dart';
import 'package:construction_mate/logic/models/profile_model.dart';
import 'package:construction_mate/logic/models/tds_model.dart';
import 'package:construction_mate/utilities/error_handling/error_handler.dart';
import 'package:construction_mate/utilities/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileRepository {
  Future<Either<Failure, TdsModel?>> fetchTdsDetails({String? year});

  Future<Either<Failure, GstModel?>> fetchGstDetails({String? year});

  Future<Either<Failure, OtherExpenseModel?>> fetchOtherExpenseDetails(
      {String? year});
  Future<Either<Failure, String>> completeProfile(
      {required String email,
      required String name,
      required String gst,
      required String phoneNumber,
      required String imageUrl,
      required String address});

  Future<Either<Failure, ProfileModel?>> getProfile();
}

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDataSource dataSource;
  ProfileRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, TdsModel?>> fetchTdsDetails({String? year}) {
    return handleErrors(() => dataSource.fetchTdsDetails(year: year));
  }

  @override
  Future<Either<Failure, GstModel?>> fetchGstDetails({String? year}) {
    return handleErrors(() => dataSource.fetchGstDetails(year: year));
  }

  @override
  Future<Either<Failure, OtherExpenseModel?>> fetchOtherExpenseDetails(
      {String? year}) {
    return handleErrors(() => dataSource.fetchOtherExpenseDetails(year: year));
  }

  @override
  Future<Either<Failure, String>> completeProfile(
      {required String email,
      required String gst,
      required String phoneNumber,
      required String name,
      required String imageUrl,
      required String address}) {
    return handleErrors(() => dataSource.completeProfile(
      name: name,
        email: email,
        gst: gst,
        phoneNumber: phoneNumber,
        imageUrl: imageUrl,
        address: address));
  }

  @override
  Future<Either<Failure, ProfileModel?>> getProfile() {
    return handleErrors(() => dataSource.getProfile());
  }
}
