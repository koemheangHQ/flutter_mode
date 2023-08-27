import 'package:flutter/material.dart';
import 'package:fluuter_model/app/widget/resusable_globle_widget/curved_progress_bar.dart';
import 'package:fluuter_model/core/themes/app_color.dart';

class BaseLoading extends StatelessWidget {
  const BaseLoading({
    Key? key,
    this.strokeWidth = 3.0,
    this.width = 25.0,
    this.height = 25.0,
  }) : super(key: key);
  final double? strokeWidth;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: CurvedCircularProgressIndicator(
          backgroundColor: ColorConstant.redColor,
          color: ColorConstant.blueBackgroundBadge,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
