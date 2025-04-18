import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/app_colors.dart';
import 'package:vehicle_booking/app/data/util/heading16Green.dart';
import 'package:vehicle_booking/app/modules/add_vehicle/controllers/add_vehicle_controller.dart';
import 'package:vehicle_booking/app/modules/home/views/home_view.dart';

class AddVehicleDetailView extends StatelessWidget {
  AddVehicleDetailView({super.key});
  final AddVehicleController controller = Get.put(AddVehicleController());
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text('Add Vehicle Detail'),
      ),
      body: Obx(
        () => Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 110.h,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 120.w,
                          child: Container(
                            width: 100.w,
                            height: 100.h,
                            decoration: BoxDecoration(
                              color: AppColors.green,
                              shape: BoxShape.circle,
                            ),
                            child: controller.pickedImage.value != null
                                ? ClipOval(
                                    child: Image.file(
                                      controller.pickedImage.value!,
                                      fit: BoxFit.cover,
                                      width: 100.w,
                                      height: 100.h,
                                    ),
                                  )
                                : Icon(
                                    Icons.drive_eta,
                                    color: Colors.white,
                                    size: 100.sp,
                                  ),
                          ),
                        ),
                        Positioned(
                          top: 70.h,
                          right: 120.w,
                          child: InkWell(
                            onTap: controller.pickImage,
                            child: Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: AppColors.lighGreen,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.photo,
                                color: AppColors.green,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Heading16Green(
                    text: "Enter Vehicle name",
                  ),
                  TextFormField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      hintText: 'Suzuki Cultus',
                      prefixIcon: Icon(
                        Icons.car_crash_outlined,
                        color: Colors.black.withValues(alpha: 0.50),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter vehicle name";
                      }
                      if (value.length < 3) {
                        return "Vehicle name be at least 3 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Heading16Green(
                    text: "Vehicle Registration no.",
                  ),
                  TextFormField(
                    controller: controller.numberController,
                    decoration: InputDecoration(
                      hintText: 'LEC-10-661',
                      prefixIcon: Icon(
                        Icons.car_crash_outlined,
                        color: Colors.black.withValues(alpha: 0.50),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Vehicle Registration no.";
                      }
                      if (value.length < 3) {
                        return "Vehicle Registration no. be at least 3 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Heading16Green(
                    text: "Contact no.",
                  ),
                  TextFormField(
                    controller: controller.contactController,
                    decoration: InputDecoration(
                      hintText: '0309 7366953',
                      prefixIcon: Icon(
                        Icons.car_crash_outlined,
                        color: Colors.black.withValues(alpha: 0.50),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Contact no.";
                      }
                      if (value.length != 11) {
                        return "Contact no. be at least 11 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Heading16Green(
                    text: "Enter Location",
                  ),
                  TextFormField(
                    controller: controller.locationController,
                    decoration: InputDecoration(
                      hintText: 'Sialkot, Punjab',
                      prefixIcon: Icon(
                        Icons.car_crash_outlined,
                        color: Colors.black.withValues(alpha: 0.50),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Location";
                      }
                      if (value.length < 3) {
                        return "Location be at least 3 characters";
                      }
                      return null;
                    },
                  ),
                  controller.selectedValue.value == 3
                      ? SizedBox.shrink()
                      : Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20.w,
                                      height: 20.h,
                                      child: Radio(
                                        value: 1,
                                        groupValue: controller.acVehicle.value,
                                        onChanged: controller.onACvehicle,
                                        activeColor: AppColors.green,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      'AC',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 80.w),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 20.w,
                                      height: 20.h,
                                      child: Radio(
                                        value: 2,
                                        groupValue: controller.acVehicle.value,
                                        onChanged: controller.onACvehicle,
                                        activeColor: AppColors.green,
                                      ),
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      'Non AC',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Heading16Green(
                    text: "Description",
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.lighGreen,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: TextFormField(
                      maxLines: 5,
                      controller: controller.descriptionController,
                      decoration: InputDecoration(
                        hintText: 'This is good car',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Description";
                        }
                        if (value.length < 3) {
                          return "Description be at least 3 characters";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (controller.pickedImage.value == null) {
                            Get.snackbar(
                              "Image Required",
                              "Please upload a vehicle photo",
                              backgroundColor: AppColors.lighGreen,
                              colorText: AppColors.green,
                            );
                            return;
                          }
                          if (_formkey.currentState!.validate()) {
                            Get.offAll(() => HomeView());
                          }
                        },
                        child: Text(
                          'Register',
                          style:
                              TextStyle(fontSize: 20, color: AppColors.white),
                        )),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
