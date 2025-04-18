import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/util/featured_vehicle_container.dart';
import 'package:vehicle_booking/app/data/util/search_form_field.dart';
import 'package:vehicle_booking/app/modules/home/controllers/home_controller.dart';

class LoaderTabview extends StatelessWidget {
  LoaderTabview({super.key});
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchFormField(),
        Expanded(
          child: ListView.builder(
            itemCount: controller.trukList.length,
            itemBuilder: (BuildContext context, int index) {
              final vehicle = controller.trukList[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
                child: FeaturedVehicleContainer(
                  name: vehicle['name'],
                  number: vehicle['number'],
                  location: vehicle['location'],
                  img: vehicle['img'],
                  phone: vehicle['phone'],
                  description: vehicle['description'],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
