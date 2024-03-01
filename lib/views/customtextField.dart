import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final Color hintColor;
  final Icon suffixIcon;
  final Icon prefixIcon;
  final Color borderColor;
  final VoidCallback? togglePasswordVisibility;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintColor = Colors.black,
    this.obscureText = false,
    required this.hintText,
    required this.suffixIcon,
    required this.prefixIcon,
    this.borderColor = Colors.black,
    this.togglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: borderColor),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor),
          suffixIcon: InkWell(
            onTap: togglePasswordVisibility, // Call the callback function
            child: suffixIcon,
          ),
          prefixIcon: prefixIcon,
        ),
      ),
    );
  }
}
