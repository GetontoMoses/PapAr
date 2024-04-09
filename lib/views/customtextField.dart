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
  final FormFieldValidator<String>? validator;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;

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
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        textCapitalization: textCapitalization,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor),
          suffixIcon: InkWell(
            onTap: () {togglePasswordVisibility!();}, // Call the callback function
            child: suffixIcon,
          ),
          prefixIcon: prefixIcon,
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
