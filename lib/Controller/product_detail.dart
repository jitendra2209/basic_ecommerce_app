import 'package:basic_ecommerce_app/Controller/home_repository.dart';
import 'package:basic_ecommerce_app/Model/product_list.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  Dio dio = Dio();

  Rx<Products>? productDetails = Products().obs;

  APIResponse response = APIResponse();

  Future fetchProductDetails(String id) async {
    try {
      final response = await HomeRepo().fetchProductDetails(id);
      productDetails?.value = response.data?.product ?? Products();

      // notifyListeners();

      // return productDetails;
    } finally {
      return Products();
    }
  }
}
