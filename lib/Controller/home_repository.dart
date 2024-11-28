import 'package:basic_ecommerce_app/Controller/interceptors.dart';
import 'package:basic_ecommerce_app/Model/product_list.dart';
import 'package:basic_ecommerce_app/Utils/baseURL.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  Dio dio = Dio();

  APIResponse response = APIResponse();

  Future<APIResponse> fetchProducts(Map<String, dynamic> query) async {
    try {
      // print("Calling api222222222222");
      dio.interceptors.add(LoggingInterceptor());
      final data = await dio.get("$baseURL/product",
          options: Options(headers: {'Authorization': 'Bearer $TOKEN'}),
          queryParameters: query);
      response = APIResponse.fromJson(data.data);
      // print("Calling api3333333333333");
      return response;

      // }
    } catch (e) {
      print(e);

      return APIResponse(success: false, message: e.toString());
    }
  }

  Future<APIResponse> fetchProductDetails(String id) async {
    try {
      ('token id$TOKEN');

      final responce = await dio.get("$baseURL/product/$id",
          options: Options(headers: {'Authorization': 'Bearer $TOKEN'}));

      APIResponse product = APIResponse.fromJson(responce.data);

      return product; // Return products list if valid
    } catch (e) {
      return APIResponse();
    }
  }
}
