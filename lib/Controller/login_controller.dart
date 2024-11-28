import 'package:basic_ecommerce_app/Controller/preferences.dart';
import 'package:basic_ecommerce_app/Utils/api_integration.dart';
import 'package:basic_ecommerce_app/Utils/baseURL.dart';
import 'package:basic_ecommerce_app/View/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onLogin(String? userName, String? passWord) async {
    if (userName!.isEmpty || passWord!.isEmpty) {
      Get.snackbar('Error', 'Please enter both email and password',
          backgroundColor: Colors.red);
      return;
    }
    try {
      final responce = await DioClient().get('$baseURL/auth/user/login',
          {"email": userName, "password": passWord});

      if (responce.data['success'] == true) {
        final token = responce.data['data']['token'];
        // print(token); // Assume API returns token here
        await Preference().saveToken(token);
        await Preference().setLoggedIn(true);
        Get.to(() => HomeScreen());
      } else {
        Get.snackbar('Error', 'Login failed: ${responce.data['message']}',
            duration: const Duration(seconds: 2), backgroundColor: Colors.red);
      }
    } catch (e) {
      Get.snackbar("Error", "'Error: ${e.toString()}'");
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
