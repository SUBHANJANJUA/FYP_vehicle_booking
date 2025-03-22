import 'package:get/get.dart';

class SignupController extends GetxController {
  var selectedValue = 2.obs;

  void onChanged(int? value) {
    if (value != null) {
      selectedValue.value = value;
    }
  }
}
