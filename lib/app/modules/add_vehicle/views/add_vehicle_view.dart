import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/app_colors.dart';
import 'package:vehicle_booking/app/modules/add_vehicle/views/add_vehicle_detail_view.dart';
import 'package:vehicle_booking/gen/assets.gen.dart';

import '../controllers/add_vehicle_controller.dart';

class AddVehicleView extends GetView<AddVehicleController> {
  const AddVehicleView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(AddVehicleController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('Add Vehicle'),
        centerTitle: true,
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 70.h,
                width: double.infinity,
              ),
              Image.asset(
                Assets.image.logo.path,
                width: 100.w,
                height: 100.h,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Please select vehicle type',
                style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.green),
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Radio(
                      value: 1,
                      groupValue: controller.selectedValue.value,
                      onChanged: controller.onChanged,
                      activeColor: AppColors.green,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Register a self drive car',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Radio(
                      value: 2,
                      groupValue: controller.selectedValue.value,
                      onChanged: controller.onChanged,
                      activeColor: AppColors.green,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Register a passenger vehicle',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Radio(
                      value: 3,
                      groupValue: controller.selectedValue.value,
                      onChanged: controller.onChanged,
                      activeColor: AppColors.green,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Register a loader vehicle',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                  width: double.infinity,
                  height: 45.h,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => AddVehicleDetailView());
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(color: AppColors.white),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
