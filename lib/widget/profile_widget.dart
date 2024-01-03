import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluuter_model/core/themes/app_color.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("message on tap");
      },
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: ColorConstant.redColor,
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(width: 2.0, color: ColorConstant.warning500),
          image: const DecorationImage(
            image: NetworkImage(
              "https://i.insider.com/657afdb950edbc52a8642002?width=700",
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
const url = "https://i.ibb.co/RNCkztc/PIA24343-03-Mars-Perseverance-Landing-Graphics-Orange-Rover.webp";
class AvatarProfile extends StatelessWidget {
  final double widthProfile;
  final double heightProfile;
  final Color borderColor;
  final double widthBorder;
  final double borderRadius;
  final double borderRadiusClipRRect;
  final String? urlImage;
  final bool isBorder;
  final VoidCallback? onTap;
  const AvatarProfile({
    super.key,
     this.widthProfile = 60.0,
     this.heightProfile = 60.0,
     this.borderColor = ColorConstant.secondaryColor,
     this.widthBorder = 1.0,
     this.borderRadius = 50.0,
     this.urlImage,
    this.borderRadiusClipRRect = 50.0,
    this.isBorder = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: widthProfile,
        width: heightProfile,
        decoration: BoxDecoration(
          border: Border.all(
            color:  isBorder ? borderColor : ColorConstant.colorStepperDisable,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: isBorder ? const  EdgeInsets.all(2): const  EdgeInsets.all(0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadiusClipRRect),
          child: Image.network(
            urlImage ?? "",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
