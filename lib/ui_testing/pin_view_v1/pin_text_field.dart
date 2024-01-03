import 'package:flutter/material.dart';
import 'package:fluuter_model/core/themes/app_color.dart';

class PinTextField extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color activeBackgroundColor;
  final Color textColor;
  final double radius;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  const PinTextField({
    Key? key,
    this.width = 40,
    this.height = 50,
    this.backgroundColor = Colors.black,
    this.radius = 8,
    this.focusNode,
    this.onChanged,
    this.activeBackgroundColor = ColorConstant.primaryColor,
    this.textColor = Colors.white,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.none,
        obscureText: true,
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.zero,
          fillColor: controller?.text != null && controller!.text.isNotEmpty
              ? activeBackgroundColor
              : backgroundColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(radius),
          ),
          counterText: "",
        ),
        onChanged: (str) {
          if (onChanged != null) {
            onChanged!(str);
          }
        },
      ),
    );
  }
}
