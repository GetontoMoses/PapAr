import 'package:flutter/material.dart';
import 'package:public_repo/views/customtext.dart';
import 'package:public_repo/views/customtextField.dart';
import 'package:public_repo/views/customButton.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isPasswordVisible = false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(67, 123, 124, 1),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 7, 48, 46),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 220,
            left: 15,
            child: Container(
              height: 600,
              width: 385,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(47, 125, 121, 0.3),
                    offset: Offset(0, 6),
                    blurRadius: 12,
                    spreadRadius: 6,
                  ),
                ],
                color: Color.fromRGBO(200, 208, 206, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    child: CustomText(
                      label: 'Create account',
                      fontsize: 25,
                      fontWeight: FontWeight.bold,
                      labelcolor: Colors.black,
                    ),
                  ),
                  CustomTextField(
                    controller: usernameController,
                    hintText: "Enter Username",
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: Icon(null),
                  ),
                  CustomTextField(
                    controller: usernameController,
                    hintText: "Enter Email",
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: Icon(null),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    hintText: "Enter Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    obscureText: !isPasswordVisible,
                    togglePasswordVisibility: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),
                  CustomTextField(
                    controller: passwordController,
                    hintText: "Confirm Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    togglePasswordVisibility: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    obscureText: !isPasswordVisible,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onPressed: () {},
                    label: ("Sign Up"),
                    buttonColor: Color.fromARGB(255, 39, 124, 124),
                    width: 25,
                    action: navigateToDashboard,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Row(
                      children: [
                        CustomText(
                            label: "Have an account? ",
                            labelcolor: Colors.black,
                          fontsize: 21,
                        ),
                          
                        CustomText(
                          label: "Login",
                          labelcolor: Color.fromARGB(255, 6, 124, 221),
                          onTap: navigateToLogin,
                          fontsize: 21,
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void navigateToLogin() {
    Get.toNamed("/");
  }

  void navigateToDashboard() {
    Get.offNamed("/home");
  }
}
