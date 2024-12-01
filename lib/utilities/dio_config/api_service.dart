import 'package:dio/dio.dart';

class ConstructionServiceApi {
  static const String basePath =
      "https://constructionmate-backend.onrender.com";
  final Dio dio;

  ConstructionServiceApi({
    Dio? dio,
    String? basePathOverride,
    required List<Interceptor> interceptors,
  }) : this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    this.dio.interceptors.addAll(interceptors);
  }
}
