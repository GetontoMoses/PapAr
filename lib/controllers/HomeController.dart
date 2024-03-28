import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedPage = 0.obs;
  final isDrawerOpen = false.obs; 
  updateSelectedPage(index) => selectedPage.value = index;
}
