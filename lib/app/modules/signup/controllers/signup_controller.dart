import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vehicle_booking/app/modules/home/views/home_view.dart';
import 'package:vehicle_booking/app/modules/owner_home/views/owner_home_view.dart';
import 'package:vehicle_booking/app/modules/signup/views/signup_view.dart';

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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign up
  Future<void> register(String email, String password, String userType) async {
    try {
      EasyLoading.show(status: 'Sign up ...');
      final userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      EasyLoading.showSuccess('Signup Successful!');
      log('v card');
      _navigateToHome(userType);
      EasyLoading.dismiss();

      await _firestore.collection('users').doc(userCred.user!.uid).set({
        'uid': userCred.user!.uid,
        'email': email,
        'userType': userType, // 'customer' or 'driver'
      });
      log('tap before navigation');
      _navigateToHome(userType);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  // Login
  Future<void> login(String email, String password) async {
    try {
      EasyLoading.show(status: 'Sign In ...');
      final userCred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final doc =
          await _firestore.collection('users').doc(userCred.user!.uid).get();

      final userType = doc['userType'];
      EasyLoading.showSuccess('Signin Successful!');
      _navigateToHome(userType);
      EasyLoading.dismiss();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void _navigateToHome(String userType) {
    log('tap after navigation');
    if (userType == 'customer') {
      Get.offAll(HomeView());
    } else if (userType == 'driver') {
      Get.offAll(OwnerHomeView());
    }
  }

  // Optional: Auto login logic
  Future<void> checkLoginStatus() async {
    final user = _auth.currentUser;
    if (user != null) {
      final doc = await _firestore.collection('users').doc(user.uid).get();
      final userType = doc['userType'];
      _navigateToHome(userType);
    } else {
      Get.offAll(SignupView());
    }
  }
}
