import 'package:flutter/material.dart';
import 'package:public_repo/pages/Home.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Home(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Color.fromARGB(255, 36, 210, 62),
          )
        ],
      ),
    );
  }
}
