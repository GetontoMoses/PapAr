import 'package:flutter/material.dart';
import 'package:public_repo/pages/Home.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Home(
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