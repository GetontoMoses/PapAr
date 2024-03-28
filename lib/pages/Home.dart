import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:public_repo/controllers/HomeController.dart';
import 'package:public_repo/pages/dashboard.dart';
import 'package:public_repo/pages/downloads.dart';
import 'package:public_repo/pages/drawer.dart';
import 'package:public_repo/pages/search.dart';
import 'package:public_repo/views/customtext.dart';

HomeController homeController = Get.put(HomeController());

class Home extends StatelessWidget {
  final Widget body;

  Home({required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 45, 148, 105),
          title: Center(
              child: CustomText(
            label: "Past Papers Repository",
            labelcolor: Colors.white,
            fontWeight: FontWeight.bold,
            fontsize: 25,
          )),
        ),
        drawer: MyDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: homeController.selectedPage.value,
          onTap: (index) {
            homeController.selectedPage.value = index;
            switch (index) {
              case 0:
                Get.to(() => Dashboard());
                break;
              case 1:
                Get.to(() => Search());
                break;
              case 2:
                Get.to(() => Downloads());
                break;
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 43, 148, 233),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.download_rounded),
              label: 'downloads',
            ),
          ],
        ),
        body: body);
  }
}
