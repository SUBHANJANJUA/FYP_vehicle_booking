import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddVehicleController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  var acVehicle = 1.obs;
  void onACvehicle(int? value) {
    if (value != null) {
      acVehicle.value = value;
    }
  }

  var selectedValue = 1.obs;
  void onChanged(int? value) {
    if (value != null) {
      selectedValue.value = value;
    }
  }

  final ImagePicker _picker = ImagePicker();
  var pickedImage = Rx<File?>(null);
  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }
}
