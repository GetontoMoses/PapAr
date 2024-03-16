import 'package:flutter/material.dart';
import 'package:public_repo/views/customtext.dart';
import 'package:public_repo/views/customtextField.dart';
import 'package:public_repo/views/customButton.dart';
import 'package:get/get.dart';
import 'package:public_repo/services/signupcall.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(177, 184, 184, 1),
      resizeToAvoidBottomInset: true,
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: Image.asset(
                        'assets/images/papAr1.jpeg',
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.22,
                  left: MediaQuery.of(context).size.width * 0.04,
                  right: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Form(
                  key: _formKey,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(58, 100, 98, 0.298),
                          offset: Offset(0, 6),
                          blurRadius: 12,
                          spreadRadius: 6,
                        ),
                      ],
                      color: Color.fromRGBO(226, 237, 235, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: CustomText(
                              label: 'Create account',
                              fontsize: 25,
                              fontWeight: FontWeight.bold,
                              labelcolor: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            controller: usernameController,
                            hintText: "Enter Username",
                            prefixIcon: Icon(Icons.person),
                            suffixIcon: Icon(null),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                          CustomTextField(
                            controller: emailController,
                            hintText: "Enter Email",
                            prefixIcon: Icon(Icons.person),
                            suffixIcon: Icon(null),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!_isValidEmail(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              // You can add password strength validation here if needed
                              return null;
                            },
                          ),
                          CustomTextField(
                            controller: confirmpasswordController,
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomButton(
                            onPressed: () {},
                            label: ("Sign Up"),
                            buttonColor: Color.fromARGB(255, 45, 148, 105),
                            width: 25,
                            action: _submitForm,
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToLogin() {
    Get.toNamed("/");
  }

  void navigateToDashboard() {
    Get.offNamed("/home");
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Form is valid, perform signup process
      // Form is valid, call the API service to sign up
      final String username = usernameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;

      ApiService.signUp(username, email, password);
      navigateToDashboard();
    }
  }

  bool _isValidEmail(String email) {
    // Simple email validation using RegExp
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
