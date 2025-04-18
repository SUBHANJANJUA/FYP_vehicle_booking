import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/app_colors.dart';
import 'package:vehicle_booking/app/data/util/headingBlack.dart';
import 'package:vehicle_booking/app/modules/vehicle_detail/views/vehicle_detail_view.dart';

class FeaturedVehicleContainer extends StatelessWidget {
  const FeaturedVehicleContainer({
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
    return InkWell(
      onTap: () => Get.to(() => VehicleDetailView(
            img: img,
            name: name,
            location: location,
            number: number,
            ac: ac,
            description: description,
            phone: phone,
          )),
      child: Container(
        padding: EdgeInsets.all(5.h),
        width: 280.w,
        height: 80.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.green.withValues(alpha: 0.4),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 70.h,
              width: 70.w,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    img,
                    fit: BoxFit.fill,
                  )),
            ),
            SizedBox(
              width: 15.h,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(child: HeadingBlack(text: name)),
                      ac == true ? TextGry(text: 'AC') : SizedBox.shrink(),
                    ],
                  ),
                  TextGry(text: number),
                  TextGry(text: location),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
