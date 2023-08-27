import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluuter_model/core/values/app_translate.dart';
import 'package:fluuter_model/route/pages/pages.dart';
import 'package:fluuter_model/route/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.yellow,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Jupyter",
      initialRoute: Pages.auth,
      getPages: Routes.pages,
      translations: AppTranslations(),
      debugShowMaterialGrid: false,
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        final num constrainedTextScaleFactor =
            mediaQueryData.textScaleFactor.clamp(1.1, 1.125);
        return MediaQuery(
          data: mediaQueryData.copyWith(
            textScaleFactor: constrainedTextScaleFactor as double?,
          ),
          child: child!,
        );
      },
    );
  }
}
