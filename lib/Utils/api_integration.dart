import 'package:dio/dio.dart';

class DioClient {
  final Dio dio = Dio();

  Future<Response<dynamic>> get(String url, Map<String, dynamic> data) async {
    try {
      final res = await dio.post(url, data: data);
      return res;
    } on DioException {
      rethrow;
    }
  }

  Future<Response<dynamic>> post(String url, Map<String, dynamic> data) async {
    try {
      final res = await dio.post(url, data: data);
      return res;
    } on DioException {
      rethrow;
    }
  }
}
