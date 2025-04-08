import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/util/heading16Green.dart';
import 'package:vehicle_booking/app/modules/home/views/home_view.dart';

import '../../../../gen/assets.gen.dart';
import '../../../data/app_colors.dart';
import '../../../data/util/signup_row.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  SignupView({super.key});
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(SignupController());

    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                    width: double.infinity,
                  ),
                  Image.asset(
                    Assets.image.logo.path,
                    width: 100.w,
                    height: 100.h,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green),
                  ),
                  Heading16Green(
                    text: "Name",
                  ),
                  TextFormField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      hintText: 'John Deo',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black.withValues(alpha: 0.50),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your name";
                      }
                      if (value.length < 3) {
                        return "Username be at least 3 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Heading16Green(
                    text: "Email",
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
                        return "Enter your Email";
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
                    height: 10.h,
                  ),
                  Heading16Green(text: 'Password'),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: controller.obsecure.value,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your password';
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
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  (controller.selectedValue == 1)
                      ? Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20.w,
                                  height: 20.h,
                                  child: Radio(
                                    value: 1,
                                    groupValue: controller.vehicletype.value,
                                    onChanged: controller.onVehicleChange,
                                    activeColor: AppColors.green,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Heading16Green(
                                  text: 'Passenger Vehicle',
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 30.w,
                                ),
                                SizedBox(
                                  width: 20.w,
                                  height: 20.h,
                                  child: Radio(
                                    value: 2,
                                    groupValue: controller.vehicletype.value,
                                    onChanged: controller.onVehicleChange,
                                    activeColor: AppColors.green,
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Heading16Green(
                                  text: 'Loader Vehicle',
                                  size: 15,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Heading16Green(
                              text: "Vehicle Name",
                            ),
                            TextFormField(
                              controller: controller.vehicleNameController,
                              decoration: InputDecoration(
                                hintText: 'Suzuki Cultus',
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.black.withValues(alpha: 0.50),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter your vechicle name";
                                }
                                if (value.length < 3) {
                                  return "Vehicle name be at least 3 characters";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Heading16Green(
                              text: "Rigistraion No.",
                            ),
                            TextFormField(
                              controller:
                                  controller.vehicleRegistrationController,
                              decoration: InputDecoration(
                                hintText: 'XYZ 1234',
                                prefixIcon: Icon(
                                  Icons.car_crash_outlined,
                                  color: Colors.black.withValues(alpha: 0.50),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter registration number";
                                }
                                if (value.length < 3) {
                                  return "Registration be at least 3 characters";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Heading16Green(
                              text: "Contact No.",
                            ),
                            TextFormField(
                              controller: controller.contactController,
                              decoration: InputDecoration(
                                hintText: '+92300 0000000',
                                prefixIcon: Icon(
                                  Icons.car_crash_outlined,
                                  color: Colors.black.withValues(alpha: 0.50),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Enter Contact number";
                                }
                                if (value.length == 14) {
                                  return "Contect number must be 13 digits";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            (controller.vehicletype.value == 1)
                                ? Row(
                                    children: [
                                      SizedBox(
                                        width: 20.w,
                                        height: 20.h,
                                        child: Radio(
                                          value: 1,
                                          groupValue: controller.ac.value,
                                          onChanged: controller.onAC,
                                          activeColor: AppColors.green,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Heading16Green(
                                        text: 'AC',
                                        size: 15,
                                      ),
                                      SizedBox(
                                        width: 30.w,
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                        height: 20.h,
                                        child: Radio(
                                          value: 2,
                                          groupValue: controller.ac.value,
                                          onChanged: controller.onAC,
                                          activeColor: AppColors.green,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Heading16Green(
                                        text: 'Non AC',
                                        size: 15,
                                      )
                                    ],
                                  )
                                : SizedBox.shrink(),
                            SizedBox(
                              height: 10.h,
                            ),
                          ],
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SizedBox(
          height: 80.h,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SignInRowWidget(),
              SizedBox(height: 5.h),
              SizedBox(
                width: double.infinity,
                height: 45.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Get.offAll(() => HomeView());
                    }
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
