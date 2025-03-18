import 'package:construction_mate/data/repository/material_repository.dart';
import 'package:construction_mate/logic/models/get_material_model.dart';
import 'package:construction_mate/logic/models/material_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../utilities/error_handling/failure.dart';

@injectable
class MaterialUsecase {
  final MaterialRepository materialRepository;
  MaterialUsecase(this.materialRepository);
  Future<Either<Failure, String>> addMaterial({required MaterialModel model}) {
    return materialRepository.addMaterial(model: model);
  }

  Future<Either<Failure, List<GetMaterialModel>>> getMaterialList(
      {required String projectId}) {
    return materialRepository.getMaterialList(projectId: projectId);
  }

  Future<Either<Failure, String>> updateMaterial(
      {required MaterialModel model}) {
    return materialRepository.updateMaterial(model: model);
  }
}
