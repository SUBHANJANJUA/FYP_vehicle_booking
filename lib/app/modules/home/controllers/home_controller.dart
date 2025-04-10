import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void toggleCurrentIndex() {
    currentIndex.value = 1;
  }
}
