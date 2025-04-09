import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/app_colors.dart';
import 'package:vehicle_booking/gen/assets.gen.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset(
          Assets.image.logo.path,
          width: 100.w,
          height: 100.h,
        ),
      ),
    );
  }
}
