import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/app_colors.dart';
import 'package:vehicle_booking/app/data/util/featured_vehicle_container.dart';
import 'package:vehicle_booking/app/modules/home/controllers/home_controller.dart';

import '../../../data/util/headingBlack.dart';

class HomeTabView extends StatelessWidget {
  HomeTabView({super.key});
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 150.h,
          decoration: BoxDecoration(
              color: AppColors.lighGreen,
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(35.r))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Welcome Back...!',
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.green),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'From passengers to packages\nbook the right vehicle for every journey, anytime, anywhere.',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.green),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingBlack(
                text: 'Featured Cars',
              ),
              SizedBox(height: 5.h),
              SizedBox(
                height: 110.h,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.carList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final vehicle = controller.carList[index];

                    if (vehicle['ac'] == true) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 15.h),
                        child: FeaturedVehicleContainer(
                          name: vehicle['name'],
                          number: vehicle['number'],
                          location: vehicle['location'],
                          img: vehicle['img'],
                          ac: vehicle['ac'],
                          phone: vehicle['phone'],
                          description: vehicle['description'],
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
              HeadingBlack(text: 'All Cars'),
              SizedBox(
                height: 350.h,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: controller.carList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final vehicle = controller.carList[index];
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
                      child: FeaturedVehicleContainer(
                        name: vehicle['name'],
                        number: vehicle['number'],
                        location: vehicle['location'],
                        img: vehicle['img'],
                        ac: vehicle['ac'],
                        phone: vehicle['phone'],
                        description: vehicle['description'],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
