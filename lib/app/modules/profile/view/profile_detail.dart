import 'package:flutter/material.dart';
import 'package:fluuter_model/core/themes/app_color.dart';

import '../../../../core/tools/app_size.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.initializeWidth(context),
      height: AppSize.initializeHeight(context),
      color: ColorConstant.primaryTextColor,
    );
  }
}
