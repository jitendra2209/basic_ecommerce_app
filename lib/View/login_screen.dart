import 'package:basic_ecommerce_app/Controller/login_controller.dart';
import 'package:basic_ecommerce_app/View/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    final height = Get.height;
    final width = Get.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
            key: loginController.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.1),
                  const Text(
                    'Please login!',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    controller: loginController.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Enter the E-mail",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0),
                              width: 1.0,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            )),
                        prefixIcon: const Icon(Icons.mail),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 25, 0, 255),
                              width: 1.0,
                            ))),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: loginController.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter the Password",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 0, 0, 0),
                              width: 1.0,
                            )),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1.0,
                            )),
                        prefixIcon: const Icon(Icons.password),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 25, 0, 255),
                              width: 1.0,
                            ))),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password? ",
                          style: TextStyle(color: Colors.indigo),
                        )),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      loginController.formKey.currentState?.validate();
                      loginController.onLogin(
                          loginController.emailController.text.trim(),
                          loginController.passwordController.text.trim());
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(width * 0.4, 40.0),
                      backgroundColor: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't you have the account?",
                        style: TextStyle(fontSize: 14.0, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const SignupScreen());
                        },
                        child: const Text("Signup!",
                            style: TextStyle(
                                fontSize: 16.0, color: Colors.indigo)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
