import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiManager {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://mp3quran.net/api/v3",
    ),
  );

  ApiManager() {
    _dio.interceptors.add(PrettyDioLogger(
      responseBody: false,
    ));
  }

  Future<dynamic> getRadios() async {
    var response = await _dio.get("/radios");

    return response.data;
  }
}
