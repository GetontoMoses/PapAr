import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:public_repo/controllers/HomeController.dart';
import 'package:public_repo/views/Dashboard.dart';

import 'package:public_repo/views/downloads.dart';
import 'package:public_repo/views/search.dart';
import 'package:public_repo/views/trial2.dart';
import 'package:public_repo/views/trialX.dart';

HomeController homeController = Get.put(HomeController());
var Screen = [Dashboard(), Search(), Trial()];

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
