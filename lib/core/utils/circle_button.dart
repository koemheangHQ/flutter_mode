import 'package:flutter/material.dart';
import 'package:fluuter_model/core/themes/app_color.dart';

class CircleButton extends StatefulWidget {
  final VoidCallback onTap;
  final Color background;
  final String? title;
  final double width;
  final double height;
  final Widget? iconData;
  const CircleButton({
    super.key,
    required this.onTap,
    this.background = ColorConstant.neutral,
    this.title,
    this.width = 50.0,
    this.height = 50.0,
    this.iconData,
  });

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.background,
      borderRadius: BorderRadius.circular(50.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(50.0),
        onTap:widget.onTap,
        child: Container(
          alignment: Alignment.center,
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: widget.iconData ?? const Text("Icons"),
        ),
      ),
    );
  }
}
