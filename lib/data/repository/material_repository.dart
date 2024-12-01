import 'package:construction_mate/data/datasource/material_data_source.dart';
import 'package:construction_mate/logic/models/material_model.dart';
import 'package:construction_mate/utilities/error_handling/error_handler.dart';
import 'package:construction_mate/utilities/error_handling/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class MaterialRepository {
  Future<Either<Failure, String>> addMaterial({required MaterialModel model});

  Future<Either<Failure, List<MaterialModel>>> getMaterialList(
      {required String projectId});

  Future<Either<Failure, String>> updateMaterial(
      {required MaterialModel model});
}

@LazySingleton(as: MaterialRepository)
class MaterialRepositoryImpl extends MaterialRepository {
  final MaterialDataSource dataSource;
  MaterialRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, String>> addMaterial({required MaterialModel model}) {
    return handleErrors(() => dataSource.addMaterial(model: model));
  }

  @override
  Future<Either<Failure, List<MaterialModel>>> getMaterialList(
      {required String projectId}) {
    return handleErrors(() => dataSource.getMaterialList(projectId: projectId));
  }

  @override
  Future<Either<Failure, String>> updateMaterial(
      {required MaterialModel model}) {
    return handleErrors(() => dataSource.updateMaterial(model: model));
  }
}
