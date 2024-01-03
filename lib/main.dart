import 'package:flutter/material.dart';
import 'package:fluuter_model/core/values/app_translate.dart';
import 'package:fluuter_model/route/pages/pages.dart';
import 'package:fluuter_model/route/routes/routes.dart';
import 'package:get/get.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.yellow,
  //     statusBarBrightness: Brightness.dark,
  //     statusBarIconBrightness: Brightness.dark,
  //   ),
  // );
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Color(0xFF2E7D32),
    //   ),
    // );
    return GetMaterialApp(
      // theme: ThemeData(
      //   useMaterial3: true,
      //   primaryColor: ColorConstant.orangeColorAvatar,
      //   colorSchemeSeed: Colors.green,
      // ),
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
          child: SubMain(
            child: child!,
          ),
        );
      },
    );
  }
}

/// We can do anything on sub main
class SubMain extends StatefulWidget {
  final Widget? child;
  const SubMain({
    super.key,
    this.child,
  });

  @override
  State<SubMain> createState() => _SubMainState();
}

class _SubMainState extends State<SubMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
    );
  }
}
