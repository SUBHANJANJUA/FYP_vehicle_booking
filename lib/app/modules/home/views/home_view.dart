import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/app_colors.dart';
import 'package:vehicle_booking/app/modules/home/views/car_tab_view.dart';
import 'package:vehicle_booking/app/modules/home/views/home_tab_view.dart';
import 'package:vehicle_booking/app/modules/home/views/laoder_tab_view.dart';
import 'package:vehicle_booking/app/modules/home/views/profile_tab_view.dart';
import 'package:vehicle_booking/app/modules/home/views/self_tab_view.dart';
import 'package:vehicle_booking/gen/assets.gen.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final List<Widget> screens = [
    HomeTabView(),
    CarsTabView(),
    LoaderTabview(),
    SelfDriveTabView(),
    ProfileTabView(),
  ];

  final List<String> appBarTitles = [
    'Home',
    'Cars',
    'Loaders',
    'Self Drive',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              Assets.image.logo.path,
              width: 50.w,
              height: 50.h,
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 1,
                    'Hi Subhan!',
                    style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.green),
                  ),
                  Text(
                    maxLines: 1,
                    'subhanjanjua837@gmail.com',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.white,
      ),
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: screens,
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green, // green background
        shape: const CircleBorder(), // optional, default is circular
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35.sp, // white icon
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          iconSize: 30.sp,
          selectedItemColor: AppColors.green,
          unselectedItemColor: AppColors.black,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex: controller.currentIndex.value,
          selectedLabelStyle:
              TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
          unselectedLabelStyle:
              TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
          onTap: (value) {
            controller.updateCurrentIndex(value);
          },
          items: [
            _buildBottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Home', index: 0),
            _buildBottomNavigationBarItem(
                icon: Icon(Icons.drive_eta), label: "Cars", index: 1),
            _buildBottomNavigationBarItem(
                icon: Icon(Icons.fire_truck), label: 'Loaders', index: 2),
            _buildBottomNavigationBarItem(
                icon: Icon(Icons.electric_car), label: "Self Drive", index: 3),
            _buildBottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Profile", index: 4),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required Icon icon,
    required String label,
    required int index,
  }) {
    return BottomNavigationBarItem(
      icon: icon,
      backgroundColor: controller.currentIndex.value == index
          ? AppColors.green
          : AppColors.black,
      label: label,
    );
  }
}
