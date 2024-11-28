import 'package:basic_ecommerce_app/Controller/signuo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  final SignupController signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.04,
            ),
            const Text(
              "Please create your account!",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                  hintText: "Enter the username",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 1.0,
                      )),
                  prefixIcon: const Icon(Icons.masks_outlined),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 25, 0, 255),
                        width: 1.0,
                      ))),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "Enter the Email",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 1.0,
                      )),
                  prefixIcon: const Icon(Icons.email_outlined),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 25, 0, 255),
                        width: 1.0,
                      ))),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Enter the password",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 1.0,
                      )),
                  prefixIcon: const Icon(Icons.password_rounded),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 25, 0, 255),
                        width: 1.0,
                      ))),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(
                  hintText: "Phone Number",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 0, 0, 0),
                        width: 1.0,
                      )),
                  prefixIcon: const Icon(Icons.phone_enabled_outlined),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 25, 0, 255),
                        width: 1.0,
                      ))),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            ElevatedButton(
              onPressed: () => signupController.onSubmit(
                  usernameController.text.trim(),
                  emailController.text.trim(),
                  passwordController.text.trim(),
                  mobileController.text.trim()),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(width * 0.4, 40.0),
                backgroundColor: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              child: const Text(
                "Signup",
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
