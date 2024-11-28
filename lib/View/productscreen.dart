import 'package:basic_ecommerce_app/Controller/productdetail.dart';

import 'package:basic_ecommerce_app/Model/productlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  String? id;
  ProductScreen({super.key, required this.id});
  final productDetailController productController =
      Get.put(productDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FutureBuilder(
            future: productController.fetchProductDetails(id!),
            builder: (context, value) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.indigo,
                      ),
                      onTap: () {
                        Get.back();
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Obx(() {
                      Products product =
                          productController.productDetails?.value ?? Products();

                      return Column(children: [
                        SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: Image.network(product?.image ?? ''),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(product?.name ?? '',
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text("Rating:${product?.rating?.toString() ?? '--'}"),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text("Price:${product?.price?.toString() ?? '--'}"),
                      ]);
                    }),
                  ]);
            }),
      )),
    );
  }
}
