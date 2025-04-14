import 'dart:async';

import 'package:get/get.dart';
import 'package:vehicle_booking/app/modules/signup/controllers/signup_controller.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration(seconds: 1), () {
      Get.find<SignupController>().checkLoginStatus();
    });
  }
}
