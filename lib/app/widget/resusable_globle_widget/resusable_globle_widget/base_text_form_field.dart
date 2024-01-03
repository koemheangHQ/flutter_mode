import 'package:flutter/material.dart';
import 'package:fluuter_model/core/themes/app_color.dart';

class BaseTextFormField extends StatelessWidget {
  const BaseTextFormField({
    Key? key,
    this.errorBorder,
    this.successBorder,
    this.focusBorder,
    this.focusErrorBorder,
    this.enableBorder,
    this.disableBorder,
    this.borderUnderline = InputBorder.none,
    this.maxLines = 1,
    this.hintText = "Please enter your name",
    this.txtController,
    required this.validator,
    this.isBorder = false,
    this.prefixIcon,
    this.borderColor = ColorConstant.primaryIconColor,
  }) : super(key: key);

  final InputBorder? errorBorder;
  final InputBorder? successBorder;
  final InputBorder? focusBorder;
  final InputBorder? focusErrorBorder;
  final InputBorder? enableBorder;
  final InputBorder? disableBorder;
  final InputBorder? borderUnderline;
  final int? maxLines;
  final String? hintText;
  final TextEditingController? txtController;
  final Function(String) validator;
  final bool isBorder;
  final Widget? prefixIcon;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
        child: TextFormField(
          controller: txtController,
          maxLines: maxLines,
          autofocus: true,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            alignLabelWithHint: true,
            prefixIcon: prefixIcon ??
                const Icon(
                  Icons.person,
                  color: ColorConstant.neutral,
                ),

            hintStyle: const TextStyle(
              wordSpacing: 12,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
            border: !isBorder
                ? OutlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8.0),
                    ),
                  )
                : null,
            // errorBorder: InputBorder.none,
            focusedBorder: const OutlineInputBorder(
              borderSide:
                  BorderSide(color: ColorConstant.primaryIconColor, width: 1.0),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
            ),
            enabledBorder: enableBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: 1.0),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
          ),
          validator: (value) => validator(value!),
        ),
      ),
    );
  }
}
