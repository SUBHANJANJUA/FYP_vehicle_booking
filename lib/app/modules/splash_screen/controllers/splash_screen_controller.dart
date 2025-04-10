import 'dart:async';

import 'package:get/get.dart';
import 'package:vehicle_booking/app/modules/signup/views/signin_view.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    // Delay for 2 seconds then navigate to SignInView
    Timer(Duration(seconds: 1), () {
      Get.offAll(SignInView()); // Replace with your sign-in route
    });
  }
}
