import 'package:flutter/widgets.dart';
import 'package:public_repo/pages/Home.dart';
import 'package:public_repo/pages/about.dart';
import 'package:public_repo/pages/help.dart';
import 'package:public_repo/pages/privacy.dart';
import 'package:public_repo/pages/settings.dart';
import 'package:public_repo/pages/starred.dart';
import 'package:public_repo/pages/dashboard.dart';
import "package:get/get.dart";
import 'package:public_repo/pages/downloads.dart';
import 'package:public_repo/pages/login.dart';
import 'package:public_repo/pages/search.dart';
import 'package:public_repo/pages/signup.dart';

class Routes {
  static var routes = [
    GetPage(name: '/', page: () => Login()),
    GetPage(name: '/home', page: () => Home(body: Column(),)),
    GetPage(name: '/signup', page: () => SignUp()),
    GetPage(name: '/dashboard', page: () => Dashboard()),
    GetPage(name: '/search', page: () => Search()),
    GetPage(name: '/downloads', page: () => Downloads()),
    GetPage(name: '/starrred', page: () => Starred()),
    GetPage(name: '/settings', page: () => Settings()),
    GetPage(name: '/about', page: () => About()),
    GetPage(name: '/help', page: () => Help()),
    GetPage(name: '/privacy', page: () => Privacy()),
  ];
}
