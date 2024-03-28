import 'package:flutter/material.dart';
import 'package:public_repo/pages/Home.dart';

class Starred extends StatefulWidget {
  const Starred({super.key});

  @override
  State<Starred> createState() => _StarredState();
}

class _StarredState extends State<Starred> {
  @override
  Widget build(BuildContext context) {
    return Home(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Color.fromARGB(255, 192, 238, 6),
          )
        ],
      ),
    );
  }
}