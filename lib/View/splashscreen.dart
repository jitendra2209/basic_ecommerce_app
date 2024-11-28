import 'dart:async';
import 'package:basic_ecommerce_app/Controller/preferences.dart';
import 'package:basic_ecommerce_app/Utils/baseURL.dart';
import 'package:basic_ecommerce_app/View/home.dart';
import 'package:basic_ecommerce_app/View/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    bool loggedIn = await Preference().getIsLoggedIn();
    TOKEN = await Preference().retrieveToken() ??
        ""; //storing token into global TOKEN value to access in another screen
    Future.delayed(const Duration(seconds: 3), () {
      if (loggedIn) {
        Get.to(HomeScreen());
      } else {
        Get.to(const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 55, 255),
    );
  }
}
