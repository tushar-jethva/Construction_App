import 'package:construction_mate/core/constants/api.dart';
import 'package:construction_mate/logic/models/add_rental_model.dart';
import 'package:construction_mate/logic/models/get_rental_model.dart';
import 'package:construction_mate/utilities/dio_config/base_data_center.dart';
import 'package:injectable/injectable.dart';

abstract class RentalDataSource {
  Future<String> addRental({required AddRentalModel rentalModel});
  Future<List<RentalModel>> getRentals({required String projectId});
  Future<String> updateRental({required AddRentalModel rentalModel});
}

@LazySingleton(as: RentalDataSource)
class RentalDataSourceImpl implements RentalDataSource {
  final dio = BaseDataCenter().dio.dio;

  @override
  Future<String> addRental({required AddRentalModel rentalModel}) async {
    try {
      print(rentalModel.toJson());
      final res = await dio.post(API.ADD_RENTAL, data: rentalModel.toJson());

      return "Rental Added";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RentalModel>> getRentals({required String projectId}) async {
    try {
      final res = await dio.get("${API.GET_RENTAL_BY_PROJECT}/$projectId");

      final data = res.data;
      List<RentalModel> list = [];

      for (var rental in data['data']) {
        list.add(RentalModel.fromJson(rental));
      }

      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> updateRental({required AddRentalModel rentalModel}) async {
    try {
      final res = await dio.put("${API.UPDATE_RENTAL}/${rentalModel.id}",
          data: rentalModel.toJson());

      return "Rental Updated";
    } catch (e) {
      rethrow;
    }
  }
}
