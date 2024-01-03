import 'package:flutter/material.dart';
import 'package:fluuter_model/core/themes/app_color.dart';

class BaseView extends StatefulWidget {
  final AppBar? appBar;
  final Widget child;
  final Widget? bottomNavigationBar;
  final Color backgroundColor;
  final Drawer? drawer;
  const BaseView({
    this.appBar,
    required this.child,
    this.bottomNavigationBar,
    this.backgroundColor = ColorConstant.primary500,
    this.drawer,
    super.key,
  });

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      backgroundColor: widget.backgroundColor,
      drawer: widget.drawer,
      bottomNavigationBar: widget.bottomNavigationBar,
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
