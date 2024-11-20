import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Api {
  final Dio _dio = Dio();
  Api() {
    _dio.options.baseUrl = "https://673736a9aafa2ef222330e54.mockapi.io";

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: false,
        responseBody: false,
        responseHeader: false,
        error: false,
        compact: false,
      ),
    );
  }

  Dio get makeRequest => _dio;
}
