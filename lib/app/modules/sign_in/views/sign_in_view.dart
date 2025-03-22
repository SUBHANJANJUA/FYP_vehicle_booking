import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/app_colors.dart';
import 'package:vehicle_booking/app/modules/forgot_password/views/forgot_password_view.dart';
import 'package:vehicle_booking/app/modules/home/views/home_view.dart';

import '../../../../gen/assets.gen.dart';
import '../../../data/util/signup_row.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  SignInView({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.white,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 150.h,
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
                    'Sign In ',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green),
                  ),
                  SizedBox(
                    height: 70.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.green),
                    ),
                  ),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black.withValues(alpha: 0.50),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Email";
                      }
                      // Email validation pattern
                      final emailRegex = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                      if (!emailRegex.hasMatch(value)) {
                        return "Enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.green),
                    ),
                  ),
                  Obx(() {
                    return TextFormField(
                      controller: controller.passwordController,
                      obscureText: controller.obsecure.value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock,
                            color: Colors.black.withValues(alpha: 0.50)),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.obsecure.value =
                                !controller.obsecure.value;
                          },
                          icon: controller.obsecure.value
                              ? Icon(Icons.remove_red_eye_outlined,
                                  color: Colors.black.withValues(alpha: 0.50))
                              : Icon(Icons.remove_red_eye,
                                  color: Colors.black.withValues(alpha: 0.50)),
                        ),
                      ),
                    );
                  }),
                  SizedBox(
                    height: 15.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => Get.to(() => ForgotPasswordView()),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  SignUpRowWidget(),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                      width: double.infinity,
                      height: 45,
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              log('sign in successfully ');
                              Get.offAll(() => HomeView());
                            }
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: AppColors.white),
                          )))
                ],
              ),
            ),
          )),
    );
  }
}
