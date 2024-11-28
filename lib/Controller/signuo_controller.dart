import 'package:basic_ecommerce_app/Utils/api_integration.dart';
import 'package:basic_ecommerce_app/Utils/baseURL.dart';
import 'package:basic_ecommerce_app/View/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  void onSubmit(
      String? username, String? email, String? password, String? mobile) async {
    try {
      final responce = await DioClient().post('$baseURL/auth/user/signup', {
        "username": username,
        "email": email,
        "password": password,
        "mobile": mobile
      });
      // print(responce);

      if (responce.data['success'] == true) {
        Get.to(() => const LoginScreen());
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Get.snackbar('', "Signup Successfully",
              backgroundColor: Colors.green);
        });
      } else {
        Get.snackbar('', 'Login failed: ${responce.data['message']}',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      print(e);
    }
  }
}
