import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/util/signup_row.dart';
import 'package:vehicle_booking/app/modules/signup/controllers/signup_controller.dart';
import 'package:vehicle_booking/app/modules/signup/views/signup_view.dart';

import '../../../../gen/assets.gen.dart';
import '../../../data/app_colors.dart';

// ignore: must_be_immutable
class SignupChoiceView extends StatelessWidget {
  SignupChoiceView({super.key});
  final controller = Get.put(SignupController());
  int selectedValue = 2;
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
                height: 250.h,
                width: double.infinity,
              ),
              Image.asset(
                Assets.image.logo.path,
                width: 100,
                height: 100,
              ),
              SizedBox(
                height: 70.h,
              ),
              Text(
                'Please select a role',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: AppColors.green),
              ),
              SizedBox(
                height: 150.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Radio(
                      value: 1,
                      groupValue: controller.selectedValue.value,
                      onChanged: controller.onChanged,
                      activeColor: AppColors.green,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Register a vehicle',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60.h),
              Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: Radio(
                      value: 2,
                      groupValue: controller.selectedValue.value,
                      onChanged: controller.onChanged,
                      activeColor: AppColors.green,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Register as a customer',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
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
                        Get.to(() => SignupView());
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(color: AppColors.white),
                      )))
            ],
          ),
        ),
      ),
    ));
  }
}
