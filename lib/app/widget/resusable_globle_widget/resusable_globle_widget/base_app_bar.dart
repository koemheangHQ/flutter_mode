import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget {
  final Widget? title;
  final bool? automaticallyImplyLeading;
  final List<Widget>? action;
  final double? elevation;
  final Color? backgroundColor;
  final bool? centerTitle;

  const BaseAppBar({
    super.key,
    this.title,
    this.automaticallyImplyLeading = false,
    this.action,
    required this.elevation,
    required this.backgroundColor,
    required this.centerTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      title: title ?? const SizedBox.shrink(),
      actions: action,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      centerTitle: centerTitle,
    );
  }
}
