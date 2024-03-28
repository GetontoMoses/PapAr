import 'package:flutter/material.dart';
import 'package:public_repo/pages/homeNot.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Home_No_app(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Color.fromARGB(255, 80, 63, 192),
          )
        ],
      ),
    );
    
  }
}