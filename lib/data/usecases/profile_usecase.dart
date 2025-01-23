import 'package:construction_mate/data/repository/profile_repository.dart';
import 'package:construction_mate/logic/models/gst_model.dart';
import 'package:construction_mate/logic/models/other_expense_model.dart';
import 'package:construction_mate/logic/models/profile_model.dart';
import 'package:construction_mate/logic/models/tds_model.dart';
import 'package:construction_mate/utilities/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileUsecase {
  final ProfileRepository _repository;
  ProfileUsecase(this._repository);

  Future<Either<Failure, TdsModel?>> fetchTdsDetails({String? year}) {
    return _repository.fetchTdsDetails(year: year);
  }

  Future<Either<Failure, GstModel?>> fetchGstDetails({String? year}) {
    return _repository.fetchGstDetails(year: year);
  }

  Future<Either<Failure, OtherExpenseModel?>> fetchOtherExpenseDetails(
      {String? year}) {
    return _repository.fetchOtherExpenseDetails(year: year);
  }

  Future<Either<Failure, String>> completeProfile(
      {required String email,
      required String gst,
      required String phoneNumber,
      required String imageUrl}) {
    return _repository.completeProfile(
        email: email, gst: gst, phoneNumber: phoneNumber, imageUrl: imageUrl);
  }

  Future<Either<Failure, ProfileModel?>> getProfile() {
    return _repository.getProfile();
  }
}
