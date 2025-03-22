import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:vehicle_booking/app/modules/home/views/home_view.dart';

import '../../../../gen/assets.gen.dart';
import '../../../data/app_colors.dart';
import '../../../data/util/signup_row.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 70.h,
                width: double.infinity,
              ),
              Image.asset(
                Assets.image.logo.path,
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: AppColors.green),
              ),
              Spacer(),
              SignInRowWidget(),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(() => HomeView());
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: AppColors.white),
                      )))
            ],
          ),
        ),
      ),
    ));
  }
}
