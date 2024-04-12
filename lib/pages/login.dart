import 'package:flutter/material.dart';
import 'package:public_repo/views/customtext.dart';
import 'package:public_repo/views/customtextField.dart';
import 'package:public_repo/views/customButton.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (bool isPop) {},
      child: Scaffold(
        backgroundColor: Color.fromRGBO(177, 184, 184, 1),
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
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.22,
                  left: MediaQuery.of(context).size.width * 0.04,
                  right: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Form(
                  key: _formKey,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.73,
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
                              label: 'Login to your account',
                              fontsize: 25,
                              fontWeight: FontWeight.bold,
                              labelcolor: Colors.black,
                            ),
                          ),
                          SizedBox(
                            height: 15,
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
                                return 'Please enter your password';
                              }
                              // You can add more password validation rules here if needed
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomButton(
                            onPressed: () {
                              if (_formKey.currentState != null) {
                                _login();
                              }
                            },
                            label: ("Login"),
                            buttonColor: Color.fromARGB(255, 45, 148, 105),
                            width: 25,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToSignup() {
    Get.toNamed("/signup");
  }

  void navigateToDashboard() {
    Get.offNamed("/dashboard");
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final String email = emailController.text;
      final String password = passwordController.text;

      // Your login API endpoint URL
      final String apiUrl = 'http://10.0.2.2:8000/student/login/';

      // Prepare the login data
      final Map<String, dynamic> loginData = {
        'email': email,
        'password': password,
      };

      // Convert login data to JSON
      final String jsonData = jsonEncode(loginData);

      try {
        // Make POST request to login endpoint
        final http.Response response = await http.post(
          Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonData,
        );

        //  ifis successful
        if (response.statusCode == 200) {
          navigateToDashboard();
        } else {
          print('Failed to login: ${response.body}');
          // Display error message to the user
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Center(child: Text('Login Failed')),
                content: Text('Please check your credentials and try again.'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } catch (error) {
        // Handle errors (e.g., connection error)
        // For example:
        print('Error logging in: $error');
        // Display error message to the user
        // showDialog(...);
      }
    }
  }

  bool _isValidEmail(String email) {
    // validation using RegExp
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
