import 'package:flutter/material.dart';
import 'package:public_repo/views/customtext.dart';
import 'package:public_repo/views/customtextField.dart';
import 'package:public_repo/views/customButton.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordVisible = false;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(67, 123, 124, 1),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.2,
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.77,
                margin: EdgeInsets.only(top: 15),
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
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: CustomText(
                          label: 'Login to your account',
                          fontsize: 25,
                          fontWeight: FontWeight.bold,
                          labelcolor: Colors.black,
                        ),
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
                      const SizedBox(height: 20),
                      CustomButton(
                        onPressed: () {},
                        label: ("Login"),
                        buttonColor: Color.fromARGB(255, 39, 124, 124),
                        width: 25,
                        action: navigateToDashboard,
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              label: "Don't have an account? ",
                              labelcolor: Colors.black),
                          CustomText(
                            label: "Signup",
                            labelcolor: Color.fromARGB(255, 6, 124, 221),
                            onTap: navigateToSignup,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.black,
                              thickness: 1.5,
                              height: 20,
                              indent: 20,
                              endIndent: 8,
                            ),
                          ),
                          CustomText(
                            label: "Login with",
                            labelcolor: Colors.black,
                            fontsize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.black,
                              thickness: 1.5,
                              height: 20,
                              indent: 8,
                              endIndent: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSignup() {
    Get.toNamed("/signup");
  }

  void navigateToDashboard() {
    Get.offNamed("/home");
  }
}