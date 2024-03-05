import 'package:flutter/material.dart';
import 'package:public_repo/configs/constants.dart';

class CustomText extends StatelessWidget {
  final String label;
  final double fontsize;
  final Color labelcolor;
  final FontWeight fontWeight;
  final VoidCallback? onTap;

  const CustomText({
    super.key,
    required this.label,
    this.fontsize = 20,
    this.labelcolor = appBlackColor,
    this.fontWeight = FontWeight.normal,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Text(
          label,
          style: TextStyle(
            fontSize: fontsize,
            color: labelcolor,
            fontWeight: fontWeight,
          ),
        ));
  }
}
 
//  The  CustomText  widget is a simple widget that takes in a few parameters and returns a  Text  widget with the specified parameters. 
//  The  text  parameter is the text to be displayed. The  size  parameter is the font size of the text. The  color  parameter is the color of the text. The  weight  parameter is the font weight of the text. The  align  parameter is the alignment of the text. 
//  The  CustomText  widget is used in the  Home  widget. 
//  Step 4: Create the  Home  widget 
//  The  Home  widget is the main widget of the app. It is a stateless widget that returns a  Scaffold  widget with an  AppBar  and a  Center  widget. The  AppBar  widget has a title of  Text('PUBLIC REPOSITORY') . The  Center  widget has a child of  CustomText('Hello World') . 
//  The  Home  widget is used in the  main  function. 
//  // Path: lib/views/home.dart