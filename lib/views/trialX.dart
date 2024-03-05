import 'package:flutter/material.dart';
import 'package:public_repo/views/customtext.dart';
import 'package:public_repo/views/customtextField.dart';
import 'package:public_repo/views/customButton.dart';
import 'package:get/get.dart';
import 'package:public_repo/views/header.dart';

final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
bool isPasswordVisible = false;

class Trial extends StatefulWidget {
  const Trial({super.key});
  @override
  _TrialState createState() => _TrialState();
}

class _TrialState extends State<Trial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(67, 123, 124, 1),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: 800, child: _head()),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transactions history',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _head() {
  return Stack(
    children: [
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 7, 48, 46),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 35,
                  left: 305,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Container(
                      height: 40,
                      width: 40,
                      color: const Color.fromRGBO(250, 250, 250, 0.1),
                      child: const Icon(
                        Icons.notification_add_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color.fromARGB(255, 224, 223, 223)),
                      ),
                      Text(
                        'G',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                            color: Color.fromARGB(255, 224, 223, 223)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Positioned(
        top: 220,
        left: 15,
        child: Container(
          height: 550,
          width: 380,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(47, 125, 121, 0.3),
                offset: Offset(0, 6),
                blurRadius: 12,
                spreadRadius: 6,
              ),
            ],
            color: Color.fromARGB(255, 121, 146, 144),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
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
                // togglePasswordVisibility: () {
                //   setState(() {
                //     isPasswordVisible = !isPasswordVisible;
                //   });
                // },
                obscureText: !isPasswordVisible,
              ),
              const SizedBox(height: 20),
              CustomButton(
                label: "Login",
                onPressed: () {},
                buttonColor: Color.fromARGB(255, 39, 124, 124),
                width: 25,
                // action: navigateToDashboard,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(
                  children: [
                    CustomText(
                      label: "Don't have an account? ",
                      labelcolor: Colors.black,
                    ),
                    CustomText(
                      label: "Signup",
                      labelcolor: Color.fromARGB(255, 6, 124, 221),
                      //  onTap: navigateToSignup,
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
                height: 20,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
