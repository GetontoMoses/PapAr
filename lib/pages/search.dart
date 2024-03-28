import 'package:flutter/material.dart';
import 'package:public_repo/pages/homeNot.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Home_No_app(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Color.fromARGB(255, 82, 171, 37),
          )
        ],
      ),
    );
  }
}
