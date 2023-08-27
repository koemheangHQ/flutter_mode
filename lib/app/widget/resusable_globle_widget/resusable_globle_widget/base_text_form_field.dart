import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      autofocus: true,
      style: const TextStyle(),
      decoration: InputDecoration(
        hintText: hintText,
        border: borderUnderline,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: enableBorder,
      ),
    );
  }
}
