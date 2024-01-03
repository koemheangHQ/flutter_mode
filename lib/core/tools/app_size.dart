import 'package:flutter/cupertino.dart';

BuildContext? context;

class AppSize {
  static final AppSize _instance = AppSize._internal();
  factory AppSize() {
    return _instance;
  }
  AppSize._internal();

  static double? _width;
  static double? _height;

  static double initializeWidth(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context).size;
    _width = mediaQueryData.width;
    return _width ?? 0;
  }

  static double initializeHeight(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context).size;
    _height = mediaQueryData.height;
    return _height ?? 0;
  }
}
