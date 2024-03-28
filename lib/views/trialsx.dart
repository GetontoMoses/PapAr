import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:public_repo/controllers/HomeController.dart';
import 'package:public_repo/pages/dashboard.dart';
import 'package:public_repo/pages/downloads.dart';
import 'package:public_repo/pages/drawer.dart';
import 'package:public_repo/pages/help.dart';
import 'package:public_repo/pages/search.dart';

HomeController homeController = Get.put(HomeController());
var Screen = [Search(), Downloads(), Help()];

class Home extends StatelessWidget {
  final Widget body;

  Home({required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: homeController.selectedPage.value,
        onTap: (index) {
          homeController.selectedPage.value = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_rounded),
            label: 'downloads',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => Center(child: Screen[homeController.selectedPage.value]),
            ),
          ),
        ],
      ),
    );
  }
}
