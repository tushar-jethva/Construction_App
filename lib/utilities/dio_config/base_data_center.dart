import 'package:construction_mate/utilities/dio_config/api_service.dart';
import 'package:construction_mate/utilities/dio_config/dio_interceptor.dart';
import 'package:dio/dio.dart';

class BaseDataCenter {
  static const String baseUrl = "https://constructionmate-backend.onrender.com";

  ConstructionServiceApi dio = ConstructionServiceApi(
      dio: Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(minutes: 1),
          receiveTimeout: const Duration(minutes: 1),
          sendTimeout: const Duration(minutes: 1),
        ),
      ),
      interceptors: [
        DioAuthInterceptor(),
      ]);
}
