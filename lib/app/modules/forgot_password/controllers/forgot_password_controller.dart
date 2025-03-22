import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var obsecure1 = true.obs;
  var obsecure2 = true.obs;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
}
