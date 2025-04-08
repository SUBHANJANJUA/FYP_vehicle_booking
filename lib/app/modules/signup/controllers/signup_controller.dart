import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var selectedValue = 2.obs;
  var vehicletype = 1.obs;
  var ac = 1.obs;
  var obsecure = true.obs;

  void onChanged(int? value) {
    if (value != null) {
      selectedValue.value = value;
    }
  }

  void onVehicleChange(int? value) {
    if (value != null) {
      vehicletype.value = value;
    }
  }

  void onAC(int? value) {
    if (value != null) {
      ac.value = value;
    }
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final vehicleNameController = TextEditingController();
  final vehicleRegistrationController = TextEditingController();
  final contactController = TextEditingController();
}
