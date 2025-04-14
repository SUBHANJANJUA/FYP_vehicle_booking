import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_booking/app/data/app_colors.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        )
      ],
    );
  }
}
