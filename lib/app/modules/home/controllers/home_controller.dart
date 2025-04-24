import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vehicle_booking/app/modules/signup/controllers/signup_controller.dart';
import 'package:vehicle_booking/gen/assets.gen.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
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
    signupcontroller.loadUserProfile();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  List<Map<String, dynamic>> trukList = [
    {
      "name": "BedFord Rocket",
      "number": "EA 1354",
      "location": "Pasrur, Sialkot",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Spacious and reliable for intercity transportation."
    },
    {
      "name": "Suzuki Ravi",
      "number": "LEC 9482",
      "location": "Lahore",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Compact and efficient for small goods delivery."
    },
    {
      "name": "Shehzore",
      "number": "RIY 2105",
      "location": "Rawalpindi",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Durable and ideal for medium-load transport."
    },
    {
      "name": "Mazda T3500",
      "number": "BSA 7780",
      "location": "Karachi",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Heavy-duty truck perfect for industrial logistics."
    },
    {
      "name": "Hino 300",
      "number": "FSD 1122",
      "location": "Faisalabad",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "High-capacity vehicle for long-distance hauls."
    },
    {
      "name": "JAC X200",
      "number": "MNA 4221",
      "location": "Multan",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Economical and ideal for light commercial use."
    },
    {
      "name": "Daehan Shehzore",
      "number": "RWP 8899",
      "location": "Rawalpindi",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Versatile truck with smooth handling and ample space."
    },
    {
      "name": "FAW Carrier",
      "number": "HYD 5403",
      "location": "Hyderabad",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Compact yet powerful cargo vehicle."
    },
    {
      "name": "Isuzu NKR",
      "number": "SKT 6732",
      "location": "Sialkot",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Trusted choice for consistent freight performance."
    },
    {
      "name": "Master Forland",
      "number": "ISB 3215",
      "location": "Islamabad",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Affordable and durable for everyday transport."
    },
    {
      "name": "Tata Ace",
      "number": "LHR 9090",
      "location": "Lahore",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Perfect for local goods movement in the city."
    },
    {
      "name": "Hyundai Porter",
      "number": "GRT 5611",
      "location": "Gujrat",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Reliable mini truck with comfortable drive."
    },
    {
      "name": "Nissan Atlas",
      "number": "KHI 7458",
      "location": "Karachi",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Powerful engine and spacious cargo space."
    },
    {
      "name": "Shacman M3000",
      "number": "MUX 4493",
      "location": "Muzaffargarh",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Heavy-duty transport truck for big jobs."
    },
    {
      "name": "Daewoo Maximus",
      "number": "QTA 3266",
      "location": "Quetta",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Built for endurance and long-haul deliveries."
    },
    {
      "name": "Dongfeng DF",
      "number": "PSH 1159",
      "location": "Peshawar",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Robust vehicle suitable for heavy cargo."
    },
    {
      "name": "Changan Karvaan Cargo",
      "number": "BWP 9001",
      "location": "Bahawalpur",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Compact cargo van with great fuel efficiency."
    },
    {
      "name": "JMC Vigus Loader",
      "number": "OKR 7412",
      "location": "Okara",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Reliable loader with sturdy build and balance."
    },
    {
      "name": "Hyundai Mighty",
      "number": "SNG 4428",
      "location": "Sanghar",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Well-built truck, ideal for all types of cargo."
    },
    {
      "name": "ZxAuto Grandtiger",
      "number": "SWL 8081",
      "location": "Sahiwal",
      "img": Assets.image.truck.path,
      "phone": "+92309 7366953",
      "description": "Tough and reliable pickup for versatile use."
    },
  ];

  List<Map<String, dynamic>> carList = [
    {
      "name": "Suzuki Cultus",
      "number": "LEC-10-661",
      "location": "Pasrur, Sialkot",
      "img": Assets.image.cultus.path,
      "ac": true,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Suzuki Alto",
      "number": "LEC-07-7965",
      "location": "Pasrur, Sialkot",
      "img": Assets.image.alto.path,
      "ac": false,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Toyota Corolla",
      "number": "ISB-18-9872",
      "location": "Islamabad",
      "img": Assets.image.cultus.path,
      "ac": true,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Honda City",
      "number": "LHR-19-3321",
      "location": "Lahore",
      "img": Assets.image.alto.path,
      "ac": true,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Honda Civic",
      "number": "FSD-17-2043",
      "location": "Faisalabad",
      "img": Assets.image.cultus.path,
      "ac": true,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Suzuki Wagon R",
      "number": "KHI-15-6542",
      "location": "Karachi",
      "img": Assets.image.alto.path,
      "ac": false,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Suzuki Mehran",
      "number": "GJR-08-1223",
      "location": "Gujrat",
      "img": Assets.image.cultus.path,
      "ac": false,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Toyota Vitz",
      "number": "SWL-13-9982",
      "location": "Sahiwal",
      "img": Assets.image.alto.path,
      "ac": true,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Hyundai Santro",
      "number": "HYD-05-7581",
      "location": "Hyderabad",
      "img": Assets.image.cultus.path,
      "ac": false,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Daihatsu Mira",
      "number": "SKT-14-2210",
      "location": "Sialkot",
      "img": Assets.image.alto.path,
      "ac": true,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Toyota Passo",
      "number": "BWP-12-7785",
      "location": "Bahawalpur",
      "img": Assets.image.cultus.path,
      "ac": true,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Kia Picanto",
      "number": "LHR-21-1098",
      "location": "Lahore",
      "img": Assets.image.alto.path,
      "ac": true,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Suzuki Bolan",
      "number": "MUX-06-5412",
      "location": "Multan",
      "img": Assets.image.cultus.path,
      "ac": false,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Changan Karvaan",
      "number": "RWP-22-1133",
      "location": "Rawalpindi",
      "img": Assets.image.alto.path,
      "ac": true,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Toyota Prius",
      "number": "ISB-16-3420",
      "location": "Islamabad",
      "img": Assets.image.cultus.path,
      "ac": true,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Honda BR-V",
      "number": "LHR-20-4521",
      "location": "Lahore",
      "img": Assets.image.alto.path,
      "ac": true,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Suzuki Swift",
      "number": "FSD-22-3901",
      "location": "Faisalabad",
      "img": Assets.image.cultus.path,
      "ac": true,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Prince Pearl",
      "number": "SKT-20-0088",
      "location": "Sialkot",
      "img": Assets.image.alto.path,
      "ac": false,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "United Bravo",
      "number": "GJR-19-7630",
      "location": "Gujrat",
      "img": Assets.image.cultus.path,
      "ac": false,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
    {
      "name": "Toyota Aqua",
      "number": "KHI-21-5566",
      "location": "Karachi",
      "img": Assets.image.alto.path,
      "ac": true,
      "phone": "+92309 7366953",
      "description": "Comfortable and reliable vehicle available for rent."
    },
  ];
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
