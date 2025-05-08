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
                  child: controller.vehicleList.isEmpty
                      ? Center(child: Text("No vehicles found."))
                      : ListView.builder(
                          itemCount: controller.vehicleList.length,
                          itemBuilder: (context, index) {
                            final vehicle = controller.vehicleList[index];
                            return vehicle.vehicleType == "self"
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 7.h),
                                    child: FeaturedVehicleContainer(
                                      name: vehicle.name,
                                      number: vehicle.number,
                                      location: vehicle.location,
                                      type: vehicle.vehicleType,
                                      ac: vehicle.acType == "AC",
                                      phone: vehicle.contact,
                                      description: vehicle.description,
                                    ),
                                  )
                                : SizedBox.shrink();
                          },
                        ),
                ),
              ],
            ),
            Column(
              children: [
                SearchFormField(),
                Expanded(
                  child: controller.vehicleList.isEmpty
                      ? Center(child: Text("No AC vehicles found."))
                      : ListView.builder(
                          itemCount: controller.vehicleList.length,
                          itemBuilder: (context, index) {
                            final vehicle = controller.vehicleList[index];
                            if (vehicle.acType == "AC") {
                              return vehicle.vehicleType == "passenger"
                                  ? Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w, vertical: 7.h),
                                      child: FeaturedVehicleContainer(
                                        name: vehicle.name,
                                        number: vehicle.number,
                                        location: vehicle.location,
                                        type: vehicle.vehicleType,
                                        ac: true,
                                        phone: vehicle.contact,
                                        description: vehicle.description,
                                      ),
                                    )
                                  : SizedBox.shrink();
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
