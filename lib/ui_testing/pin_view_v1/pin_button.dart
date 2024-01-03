import 'package:flutter/material.dart';
import 'package:fluuter_model/core/themes/app_color.dart';

class PinButton extends StatefulWidget {
  final String? title;
  final String? iconImage;
  final bool isTitleBold;
  final Color titleColor;
  final Color color;
  final bool isShadow;
  final double height;
  final double? width;
  final double radius;
  final VoidCallback? onTap;
  const PinButton({
    Key? key,
    this.title,
    this.iconImage,
    this.onTap,
    this.isTitleBold = true,
    this.titleColor = const Color(0xff666666),
    this.color = Colors.white,
    this.isShadow = true,
    this.height = 56.0,
    this.radius = 10,
    this.width,
  }) : super(key: key);

  @override
  State<PinButton> createState() => _PinButtonState();
}

class _PinButtonState extends State<PinButton> {
  late Color titleColor;

  @override
  void initState() {
    super.initState();
    titleColor = widget.titleColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width ?? MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        // color: onTap != null ? color : color.withOpacity(0.5),
        color: Colors.white,
        borderRadius: BorderRadius.circular(widget.radius),
        boxShadow: widget.isShadow
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 3),
                  blurRadius: 8,
                )
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        type: MaterialType.button,
        borderRadius: BorderRadius.circular(widget.radius),
        child: InkWell(
          onTap: () {
            if (widget.onTap != null) {
              widget.onTap!();
            }
            setState(() {
              titleColor = widget.titleColor;
            });
          },
          onTapDown: (details) {
            setState(() {
              titleColor = Colors.white;
            });
          },
          onTapCancel: () {
            setState(() {
              titleColor = widget.titleColor;
            });
          },
          highlightColor: ColorConstant.primaryColor,
          splashColor: ColorConstant.primaryColor,
          borderRadius: BorderRadius.circular(widget.radius),
          child: Container(
            width: widget.width ?? MediaQuery.of(context).size.width,
            height: widget.height,
            alignment: Alignment.center,
            child: widget.iconImage != null
                ? SizedBox(
                    height: 22,
                    child: Image.asset(
                      widget.iconImage!,
                      color: titleColor,
                    ),
                  )
                : Text(
                    widget.title ?? 'N/A',
                    style: TextStyle(
                      fontSize: 22,
                      color: titleColor,
                      fontWeight: widget.isTitleBold ? FontWeight.bold : null,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
