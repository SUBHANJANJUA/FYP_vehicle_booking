import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/app_colors.dart';
import 'package:vehicle_booking/app/data/util/custom_appbar.dart';

import '../controllers/vehicle_detail_controller.dart';

class VehicleDetailView extends GetView<VehicleDetailController> {
  const VehicleDetailView({
    super.key,
    required this.name,
    required this.number,
    required this.location,
    required this.description,
    required this.phone,
    required this.type,
    this.ac,
  });
  final String name;
  final String number;
  final String location;

  final String phone;
  final String type;
  final String description;
  final bool? ac;
  @override
  Widget build(BuildContext context) {
    Get.put(VehicleDetailController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: 'Vehicle Details View'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: AppColors.lighGreen),
                child: Center(
                  child: Icon(
                    type == "loader"
                        ? Icons.fire_truck_outlined
                        : type == "bike"
                            ? Icons.motorcycle_outlined
                            : Icons.directions_car,
                    color: AppColors.green,
                    size: 80.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    number,
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.grey),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              ac == true
                  ? Text(
                      "AC",
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.grey),
                    )
                  : SizedBox.shrink(),
              SizedBox(
                height: 5.h,
              ),
              Text(
                phone,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.grey),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                location,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.grey),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(description),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ElevatedButton(
            onPressed: () {
              log(phone);
              controller.callNumber(phone);
            },
            child: Text(
              'Book Now',
              style: TextStyle(color: AppColors.white),
            )),
      ),
    );
  }
}
