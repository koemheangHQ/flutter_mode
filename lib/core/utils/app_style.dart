import 'package:flutter/material.dart';
import 'package:fluuter_model/core/themes/app_color.dart';
import 'package:fluuter_model/core/utils/env.dart';

class AppStyle {
  AppStyle._();

  static ThemeData themeData() {
    return ThemeData(
      primaryColor: ColorConstant.primaryColor,
      fontFamily:
          Environment.mapLocale().countryCode == "KH" ? 'Battambang' : 'Inter',
      scaffoldBackgroundColor: ColorConstant.primaryBackgroundColor,
      unselectedWidgetColor: const Color(0xFFDFE4E9),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 14),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorConstant.white,
        elevation: 0,
        foregroundColor: ColorConstant.primaryTextColor,
        titleTextStyle: TextStyle(
            fontWeight: _bold,
            fontSize: 18.0,
            color: ColorConstant.primaryTextColor),
      ),
      textTheme: _textTheme,
      canvasColor: Colors.transparent,
    );
  }

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
        fontWeight: _regular,
        fontSize: 96.0,
        color: ColorConstant.primaryTextColor),
    displayMedium: TextStyle(
        fontWeight: _regular,
        fontSize: 60.0,
        color: ColorConstant.primaryTextColor),
    displaySmall: TextStyle(
        fontWeight: _regular,
        fontSize: 48.0,
        color: ColorConstant.primaryTextColor),
    headlineMedium: TextStyle(
        fontWeight: _regular,
        fontSize: 34.0,
        color: ColorConstant.primaryTextColor),
    headlineSmall: TextStyle(
        fontWeight: _regular,
        fontSize: 24.0,
        color: ColorConstant.primaryTextColor),
    titleLarge: TextStyle(
        fontWeight: _medium,
        fontSize: 18.0,
        color: ColorConstant.primaryTextColor),
    titleMedium: TextStyle(
        fontWeight: _regular,
        fontSize: 16.0,
        color: ColorConstant.primaryTextColor),
    titleSmall: TextStyle(
        fontWeight: _medium,
        fontSize: 14.0,
        color: ColorConstant.primaryTextColor),
    bodyLarge: TextStyle(
        fontWeight: _regular,
        fontSize: 14.0,
        color: ColorConstant.primaryTextColor),
    bodyMedium: TextStyle(
        fontWeight: _regular,
        fontSize: 12.0,
        color: ColorConstant.primaryTextColor),
    labelLarge: TextStyle(
        fontWeight: _semiBold,
        fontSize: 14.0,
        color: ColorConstant.primaryTextColor),
    bodySmall: TextStyle(
        fontWeight: _regular,
        fontSize: 16.0,
        color: ColorConstant.primaryTextColor),
    labelSmall: TextStyle(
        fontWeight: _regular,
        fontSize: 10.0,
        color: ColorConstant.primaryTextColor),
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;
}
