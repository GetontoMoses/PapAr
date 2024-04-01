import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_repo/pages/Home.dart';
import 'package:public_repo/pages/dashboard.dart';
import 'package:public_repo/pages/downloads.dart';
import 'package:public_repo/pages/search.dart';
import 'package:public_repo/views/action.dart';
import 'package:public_repo/views/fab.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Home(
      body: Column(
        children: [
          Container(
            height: 100,
            color: Color.fromARGB(255, 39, 106, 126),
          )
        ],
      ),
    );
  }
}
