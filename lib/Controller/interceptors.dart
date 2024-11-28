import 'dart:convert';

import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(jsonEncode(options.method));
    print(jsonEncode(options.baseUrl + options.path));
    print(jsonEncode('Query:::${options.uri.queryParameters}'));
    print(jsonEncode(options.headers));
    print(jsonEncode(options.contentType));
    print('BODY:::::::::${jsonEncode(options.data)}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    try {
      print('DATA:::::::::${jsonEncode(response.data)}');
    } catch (e) {
      print('FAILED TO INTERCEPT::$e');
    }

    super.onResponse(response, handler);
  }
}
