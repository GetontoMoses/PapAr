import 'package:flutter/material.dart';
import 'package:public_repo/pages/Home.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Home(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Colors.amberAccent,
          )
        ],
      ),
    );
  }
}
