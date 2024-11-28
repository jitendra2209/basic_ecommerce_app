import 'package:basic_ecommerce_app/Controller/homeProvider.dart';
import 'package:basic_ecommerce_app/Controller/preferences.dart';
import 'package:basic_ecommerce_app/Model/productlist.dart';
import 'package:basic_ecommerce_app/View/login.dart';
import 'package:basic_ecommerce_app/View/productscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  RangeValues values = const RangeValues(0, 50000);

  Map<int, String> categories = {
    1: '1&above',
    2: '2&above',
    3: '3&above',
    4: '4&above',
    5: '5'
  };

  final _searchController = TextEditingController();

  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(children: [
                const Text('Home Page',
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      hintText: "Search Product",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 0, 0, 0),
                            width: 1.0,
                          )),
                      suffixIcon: GestureDetector(
                        onTap: () => homeController.fetchProducts(
                            text: _searchController.text),
                        child: const Icon(Icons.search),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 25, 0, 255),
                            width: 1.0,
                          ))),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Filtering by BottomSheet'),
                    ElevatedButton(
                        onPressed: () => bottomSheet(context),
                        child: const Text('Filter'))
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(child: Obx(() {
                  // print("boollllllllllllll${homeController.isLoading.value}");
                  return homeController.isLoading.value
                      ? ListView.builder(
                          itemCount: 7,
                          itemBuilder: (context, index) => shimmerCard(),
                        )
                      : ListView.builder(
                          itemCount: homeController.productList?.length,
                          itemBuilder: (context, index) {
                            Products? product =
                                homeController.productList?[index];
                            return Card(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: ListTile(
                                  subtitle: Text(
                                      "Rating:${product?.rating?.toString() ?? '--'}"),
                                  title: Text(product?.name ?? ''),
                                  leading: SizedBox.square(
                                    dimension: 60,
                                    child: Image.network(
                                      product?.image ?? '',
                                      width: 60,
                                      height: 60,
                                    ),
                                  ),
                                  trailing: Text('${product?.price ?? '--'}'),
                                  onTap: () {
                                    Get.to(
                                        () => ProductScreen(id: product?.sId));
                                  },
                                ));
                          });
                }))
              ]))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Preference().setLoggedIn(false);
          Preference().clear();
          final route =
              MaterialPageRoute(builder: (context) => const LoginScreen());
          Navigator.pushReplacement(context, route);
        },
        child: const Icon(Icons.logout),
      ),
    );
  }

  bottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (context, setSState) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Filters'),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Customer Rating'),
                          DropdownButton<int>(
                              value: homeController.pRating,
                              //isExpanded: true,
                              hint: const Text(
                                'Category',
                                style: TextStyle(color: Colors.black),
                              ),
                              dropdownColor: Colors.white,
                              items: categories.entries
                                  .map((entry) => DropdownMenuItem(
                                        value: entry.key,
                                        child: Text(entry.value.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setSState(() {
                                  homeController.pRating = value;
                                });

                                // fetchProducts(Rating: value);
                                // Navigator.pop(context);
                              }),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text('Price Range'),
                      const SizedBox(
                        height: 15.0,
                      ),
                      RangeSlider(
                        values: values,
                        min: 0,
                        max: 50000,
                        // divisions: 10,
                        labels: RangeLabels(values.start.toStringAsFixed(1),
                            values.end.toStringAsFixed(1)),
                        onChanged: (RangeValues newValues) {
                          setSState(() {
                            values = newValues;
                          });
                          homeController.minRange = newValues.start.toInt();
                          homeController.maxRange = newValues.end.toInt();

                          // fetchProducts();
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateColor.resolveWith(
                                  (states) => Colors.indigo),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              homeController.fetchProducts(
                                  Rating: homeController.pRating,
                                  min_Range: homeController.minRange,
                                  max_Range: homeController.maxRange);
                            },
                            child: const Text(
                              'Apply Filters',
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ]),
              ),
            );
          });
        });
  }
}

shimmerCard() {
  return Card(
      color: Colors.white.withOpacity(.9),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 60,
            height: 60,
            color: Colors.white,
          ),
        ),
        title: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 8.0),
            child: Container(
              height: 15,
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 5),
            ),
          ),
        ),
        subtitle: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            height: 10,
            color: Colors.white,
          ),
        ),
        trailing: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: 40,
            height: 20,
            color: Colors.white,
          ),
        ),
      ));
}
