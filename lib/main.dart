import 'package:flutter/material.dart';
import 'package:public_repo/views/customtext.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          label: 'PUBLIC REPOSITORY',
        ),
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
