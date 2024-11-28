import 'package:basic_ecommerce_app/Controller/homeProvider.dart';
import 'package:basic_ecommerce_app/Controller/productdetail.dart';
import 'package:basic_ecommerce_app/View/splashscreen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //     // providers: [
    //     //   ChangeNotifierProvider(
    //     //     create: (_) => HomeController()..fetchProducts(),
    //     //   ),
    //     //   ChangeNotifierProvider(create: (_) => productDetailProvider()),
    //     // ],
    //     builder: (context, _) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SplashScreen(),
      ),
    );
  }
}
