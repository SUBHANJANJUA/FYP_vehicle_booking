import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_booking/app/data/models/vehicle_model.dart';
import 'package:vehicle_booking/app/modules/signup/controllers/signup_controller.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var vehicleList = <VehicleModel>[].obs;

  Future<void> fetchAllVehicles() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('vehicles')
        .orderBy('createdAt', descending: true)
        .get();

    vehicleList.value = snapshot.docs
        .map((doc) => VehicleModel.fromJson(doc.data(), doc.id))
        .toList();
  }

  final SignupController signupcontroller = Get.find<SignupController>();
  var currentIndex = 0.obs;
  late TabController tabController;
  var selectedFilterIndex = 0.obs;

  void updateCurrentIndex(int index) {
    currentIndex.value = index;
  }

  void toggleCurrentIndex() {
    currentIndex.value = 1;
  }

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    tabController.index = 0;
    currentIndex.value = 0;
    selectedFilterIndex.value = 0;
    signupcontroller.loadUserProfile();
    fetchAllVehicles();
  }

  void resetTabIndex() {
    currentIndex.value = 0;
    selectedFilterIndex.value = 0;
    tabController.index = 0;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

class ProfileController extends GetxController {
  final box = GetStorage();
  final Rxn<File> pickedImage = Rxn<File>();

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final file = File(image.path);
      pickedImage.value = file;

      // Convert to base64 and store
      final bytes = await file.readAsBytes();
      final base64Image = base64Encode(bytes);
      box.write('profile_image', base64Image);
    }
  }

  void loadStoredImage() {
    final base64Image = box.read('profile_image');
    if (base64Image != null) {
      final bytes = base64Decode(base64Image);
      final file = File('${Directory.systemTemp.path}/profile_image.png');
      file.writeAsBytesSync(bytes);
      pickedImage.value = file;
    }
  }

  @override
  void onInit() {
    loadStoredImage();

    super.onInit();
  }
}
