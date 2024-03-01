import 'package:flutter/material.dart';
import 'package:public_repo/views/customtext.dart';
import 'package:public_repo/configs/constants.dart';
import 'package:public_repo/views/customtextField.dart';
import 'package:public_repo/views/customButton.dart';
import 'package:get/get.dart';
import 'package:public_repo/views/header.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 320,
            child: head(),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                label: 'Log In',
                fontsize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomTextField(
            controller: usernameController,
            hintText: "Enter Email",
            prefixIcon: Icon(Icons.person),
            suffixIcon: Icon(null),
          ),
          CustomTextField(
            controller: passwordController,
            hintText: "Enter Password",
            prefixIcon: Icon(Icons.password),
            suffixIcon: Icon(Icons.remove_red_eye),
          ),
          const SizedBox(height: 20),
          CustomButton(
            label: "Sign In",
            onPressed: () {},
            buttonColor: Color.fromARGB(255, 39, 124, 124),
            width: 20,
            action: navigateToDashboard,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(
              children: [
                CustomText(
                  label: "dont have an account? ",
                  labelcolor: Colors.blue,
                ),
                CustomButton(
                    label: "Sign Up",
                    onPressed: () {},
                    action: navigateToSignup,
                    buttonColor: Color.fromARGB(255, 202, 200, 200))
              ],
            ),
          ),
        ],
      ),
    ));
  }

  void navigateToSignup() {
    Get.toNamed("/signup");
  }

  void navigateToDashboard() {
    Get.offNamed("/home");
  }
}
