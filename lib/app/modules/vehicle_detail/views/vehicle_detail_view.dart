import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/app_colors.dart';

import '../controllers/vehicle_detail_controller.dart';

class VehicleDetailView extends GetView<VehicleDetailController> {
  const VehicleDetailView({
    super.key,
    required this.name,
    required this.number,
    required this.location,
    required this.img,
    required this.description,
    required this.phone,
    this.ac,
  });
  final String name;
  final String number;
  final String location;
  final String img;
  final String phone;
  final String description;
  final bool? ac;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('Vehicle Detail View'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.h,
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
            onPressed: () {},
            child: Text(
              'Book Now',
              style: TextStyle(color: AppColors.white),
            )),
      ),
    );
  }
}
