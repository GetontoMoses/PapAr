import 'package:public_repo/pages/about.dart';
import 'package:public_repo/pages/help.dart';
import 'package:public_repo/pages/profile.dart';
import 'package:public_repo/pages/settings.dart';
import 'package:public_repo/pages/myuploads.dart';
import 'package:public_repo/pages/dashboard.dart';
import "package:get/get.dart";
import 'package:public_repo/pages/downloads.dart';
import 'package:public_repo/pages/login.dart';
import 'package:public_repo/pages/search.dart';
import 'package:public_repo/pages/signup.dart';
import 'package:public_repo/pages/upload.dart';


class Routes {
  static var routes = [
    GetPage(name: '/', page: () => Login()),
    GetPage(name: '/upload', page: () => Upload()),
    GetPage(name: '/signup', page: () => SignUp()),
    GetPage(name: '/dashboard', page: () => Dashboard()),
    GetPage(name: '/search', page: () => Search()),
    GetPage(name: '/downloads', page: () => Downloads()),
    GetPage(name: '/uploads', page: () => MyUploads()),
    GetPage(name: '/settings', page: () => Settings()),
    GetPage(name: '/about', page: () => About()),
    GetPage(name: '/help', page: () => Help()),
    GetPage(name: '/profile', page: () => Profile()),
  ];
}
