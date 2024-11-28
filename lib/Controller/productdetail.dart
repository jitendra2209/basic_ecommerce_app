import 'package:basic_ecommerce_app/Controller/homecontroller.dart';
import 'package:basic_ecommerce_app/Model/productlist.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';

class productDetailController extends GetxController {
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
