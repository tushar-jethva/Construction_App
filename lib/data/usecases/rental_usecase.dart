import 'package:construction_mate/data/repository/rental_repository.dart';
import 'package:construction_mate/logic/models/add_rental_model.dart';
import 'package:construction_mate/logic/models/get_rental_model.dart';
import 'package:construction_mate/logic/models/project_partie_model.dart';
import 'package:construction_mate/logic/models/rental/rental_model.dart';
import 'package:construction_mate/utilities/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class RentalUsecase {
  final RentalRepository _repository;
  RentalUsecase(this._repository);

  Future<Either<Failure, String>> addRental(
      {required AddRentalModel rentalModel}) {
    return _repository.addRental(rentalModel: rentalModel);
  }

  Future<Either<Failure, List<GetRentalModel>>> getRentals(
      {required String projectId}) {
    return _repository.getRentals(projectId: projectId);
  }

  Future<Either<Failure, String>> updateRental(
      {required AddRentalModel rentalModel}) {
    return _repository.updateRental(rentalModel: rentalModel);
  }

  Future<Either<Failure, List<GetRentalModel>>> getRentalByPartie(
      {required String partieId}) {
    return _repository.getRentalByPartie(partieId: partieId);
  }

  Future<Either<Failure, RentalModel>> getProjectRentalParties(
      {required String projectId}) {
    return _repository.getProjectRentalParties(projectId: projectId);
  }
}
