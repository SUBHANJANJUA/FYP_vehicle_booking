import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_booking/app/data/models/vehicle_model.dart';

class AddVehicleController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  var acVehicle = 1.obs; // 1 = AC, else NonAC
  var vehicleType = 1.obs; // 1 = self, 2 = passenger, 3 = loader, else = bike

  void onACvehicle(int? value) {
    if (value != null) acVehicle.value = value;
  }

  void onChangedVehicleType(int? value) {
    if (value != null) vehicleType.value = value;
  }

  /// Save vehicle globally in shared `vehicles` collection
  Future<void> saveVehicleToFirebase({required String userId}) async {
    String acType = acVehicle.value == 1 ? "AC" : "NonAC";
    String vehicleTypeText = vehicleType.value == 1
        ? "self"
        : vehicleType.value == 2
            ? "passenger"
            : vehicleType.value == 3
                ? "loader"
                : "bike";

    VehicleModel vehicle = VehicleModel(
      name: nameController.text.trim(),
      number: numberController.text.trim(),
      contact: contactController.text.trim(),
      location: locationController.text.trim(),
      description: descriptionController.text.trim(),
      acType: acType,
      vehicleType: vehicleTypeText,
      userId: userId,
      createdAt: DateTime.now(),
    );

    await FirebaseFirestore.instance
        .collection('vehicles') // Global collection
        .add(vehicle.toJson());
  }
}
