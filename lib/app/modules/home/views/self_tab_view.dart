import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/app_colors.dart';
import 'package:vehicle_booking/app/data/util/featured_vehicle_container.dart';
import 'package:vehicle_booking/app/data/util/search_form_field.dart';
import 'package:vehicle_booking/app/modules/home/controllers/home_controller.dart';

class SelfDriveTabView extends StatelessWidget {
  SelfDriveTabView({super.key});

  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TabBar(
        dividerColor: AppColors.white,
        controller: controller.tabController,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 4.w, color: AppColors.green),
        ),
        labelColor: AppColors.black,
        unselectedLabelColor: AppColors.grey,
        labelStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
        tabs: [Tab(text: 'All Cars'), Tab(text: 'AC Cars')],
      ),
      SizedBox(height: 20.h),
      Expanded(
        child: TabBarView(
          controller: controller.tabController,
          children: [
            Column(
              children: [
                SearchFormField(),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.carList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final vehicle = controller.carList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 7.w, vertical: 7.h),
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
                ),
              ],
            ),
            Column(
              children: [
                SearchFormField(),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.carList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final vehicle = controller.carList[index];

                      if (vehicle['ac'] == true) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.w, vertical: 7.h),
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
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
