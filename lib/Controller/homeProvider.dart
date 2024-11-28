import 'package:basic_ecommerce_app/Controller/homecontroller.dart';
import 'package:basic_ecommerce_app/Model/productlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;
  int? pRating;
  int? minRange;
  int? maxRange;

  RxList<Products>? productList = RxList(<Products>[].obs);

  HomeRepo repo = HomeRepo();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  Future fetchProducts(
      {String? text, int? Rating, int? min_Range, int? max_Range}) async {
    try {
      isLoading.value = true;
      // print("Boooooooooool::::::::::::::::");

      Map<String, dynamic> query = {};
      if ((text ?? '').isNotEmpty) {
        query['name'] = text;
      }
      if (Rating != null) {
        query['min_rating'] = Rating;
        // print(query);
      }
      if (min_Range != null) {
        query['min_range'] = min_Range;
      }
      if (max_Range != null) {
        query['max_range'] = max_Range;
      }
      // print("Calling api");
      final response = await repo.fetchProducts(query);
      productList?.value = response.data?.products ?? [];
      isLoading.value = false;

      // print(isLoading.value);

      // return productList!;
    } catch (e) {
      isLoading.value = false;
      print(e);
    } finally {
      isLoading.value = false;

      // return [];
    }
  }
}
