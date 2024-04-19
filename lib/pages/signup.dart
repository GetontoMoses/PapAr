import 'package:flutter/material.dart';
import 'package:public_repo/views/customtext.dart';
import 'package:public_repo/views/customtextField.dart';
import 'package:public_repo/views/customButton.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isPasswordVisible1 = true;
  bool isPasswordVisible2 = true;
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
                            suffixIcon: Icon(isPasswordVisible1
                                ? Icons.visibility
                                : Icons.visibility_off),
                            obscureText: !isPasswordVisible1,
                            togglePasswordVisibility: () {
                              setState(() {
                                isPasswordVisible1 = !isPasswordVisible1;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }

                              // Password strength validation rules
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters long';
                              }

                              if (!RegExp(r'[a-z]').hasMatch(value)) {
                                return 'Password must contain at least one lowercase letter';
                              }

                              if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                                  .hasMatch(value)) {
                                return 'Password must contain at least one special character';
                              }

                              // Password meets all criteria, return null (no error)
                              return null;
                            },
                          ),
                          CustomTextField(
                            controller: confirmpasswordController,
                            hintText: "Confirm Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(isPasswordVisible2
                                ? Icons.visibility
                                : Icons.visibility_off),
                            togglePasswordVisibility: () {
                              setState(() {
                                isPasswordVisible2 = !isPasswordVisible2;
                              });
                            },
                            obscureText: !isPasswordVisible2,
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
                            onPressed: () {
                              _submitForm();
                            },
                            label: ("Sign Up"),
                            buttonColor: Color.fromARGB(255, 45, 148, 105),
                            width: 25,
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
    Get.offNamed("/dashboard");
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final String username = usernameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;

      Map<String, dynamic> userData = {
        'username': username,
        'email': email,
        'password': password,
      };

      // Convert the data to JSON
      String jsonData = jsonEncode(userData);

      // Convert your backend API URL string to a Uri object
      Uri apiUrl = Uri.parse('http://10.0.2.2:8000/student/signup/');

      // Make a POST request to your Django backend API
      try {
        final response = await http.post(
          apiUrl,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonData,
        );

        // if the request is successful
        if (response.statusCode == 201) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Center(child: Text('Account created successfully')),
              );
            },
          );

          // Delay navigation to dashboard by 2 seconds (adjust as needed)
          await Future.delayed(Duration(seconds: 1));
          navigateToLogin();
        } else {
          // Handle other status codes (e.g., display error message)
          print('Failed to register: ${response.body}');
           showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Center(child: Text('Registration Failed')),
                content: Text('User with this email already exists.'),
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
        print('Error registering user: $error');
      }
    }
  }

  bool _isValidEmail(String email) {
    // validation using RegExp
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
