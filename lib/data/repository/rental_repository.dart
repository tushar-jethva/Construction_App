import 'package:construction_mate/data/datasource/rental_data_source.dart';
import 'package:construction_mate/logic/models/add_rental_model.dart';
import 'package:construction_mate/logic/models/get_rental_model.dart';
import 'package:construction_mate/logic/models/project_partie_model.dart';
import 'package:construction_mate/logic/models/rental/rental_model.dart';
import 'package:construction_mate/utilities/error_handling/error_handler.dart';
import 'package:construction_mate/utilities/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class RentalRepository {
  Future<Either<Failure, String>> addRental(
      {required AddRentalModel rentalModel});
  Future<Either<Failure, List<GetRentalModel>>> getRentals(
      {required String projectId});
  Future<Either<Failure, String>> updateRental(
      {required AddRentalModel rentalModel});
  Future<Either<Failure, List<GetRentalModel>>> getRentalByPartie(
      {required String partieId});
  Future<Either<Failure, RentalModel>> getProjectRentalParties(
      {required String projectId});
}

@LazySingleton(as: RentalRepository)
class RentalRepositoryImpl implements RentalRepository {
  final RentalDataSource dataSource;
  RentalRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, String>> addRental(
      {required AddRentalModel rentalModel}) {
    return handleErrors(() => dataSource.addRental(rentalModel: rentalModel));
  }

  @override
  Future<Either<Failure, List<GetRentalModel>>> getRentals(
      {required String projectId}) {
    return handleErrors(() => dataSource.getRentals(projectId: projectId));
  }

  @override
  Future<Either<Failure, String>> updateRental(
      {required AddRentalModel rentalModel}) {
    return handleErrors(
        () => dataSource.updateRental(rentalModel: rentalModel));
  }

  @override
  Future<Either<Failure, List<GetRentalModel>>> getRentalByPartie(
      {required String partieId}) {
    return handleErrors(() => dataSource.getRentalByPartie(partieId: partieId));
  }

  @override
  Future<Either<Failure, RentalModel>> getProjectRentalParties(
      {required String projectId}) {
    return handleErrors(
        () => dataSource.getProjectRentalParties(projectId: projectId));
  }
}
