import 'package:flutter/material.dart';
import 'package:public_repo/pages/Home.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
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