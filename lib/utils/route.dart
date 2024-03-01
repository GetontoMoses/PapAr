import 'package:public_repo/views/Home.dart';
import 'package:public_repo/views/dashboard.dart';
import "package:get/get.dart";
import 'package:public_repo/views/downloads.dart';
import 'package:public_repo/views/login.dart';
import 'package:public_repo/views/search.dart';
import 'package:public_repo/views/signup.dart';

class Routes {
  static var routes = [
    GetPage(name: '/', page: () => Login()),
    GetPage(name: '/home', page: () => Home()),
    GetPage(name: '/signup', page: () => SignUp()),
    GetPage(name: '/dashboard', page: () => Dashboard()),
    GetPage(name: '/search', page: () => Search()),
    GetPage(name: '/downloads', page: () => Downloads()),
  ];
}
