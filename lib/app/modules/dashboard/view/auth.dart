import 'package:flutter/material.dart';
import 'package:fluuter_model/core/themes/app_color.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        color: ColorConstant.orangeColor,
      ),
    );
  }
}
