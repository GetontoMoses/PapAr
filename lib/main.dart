import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:public_repo/utils/route.dart';

void main() {
  runApp(GetMaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes));
}
