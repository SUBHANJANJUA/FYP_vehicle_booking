import 'package:flutter/material.dart';
import 'package:vehicle_booking/app/data/app_colors.dart';

class YourVehicleView extends StatelessWidget {
  const YourVehicleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text("Your Vehicle"),
      ),
    );
  }
}
