import 'package:flutter/material.dart';
import 'package:public_repo/pages/homeNot.dart';

class Downloads extends StatefulWidget {
  const Downloads({super.key});

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  @override
  Widget build(BuildContext context) {
    return Home_No_app(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Color.fromARGB(255, 42, 125, 148),
          )
        ],
      ),
    );
  }
}