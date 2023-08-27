import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluuter_model/app/modules/dashboard/view/auth.dart';
import 'package:fluuter_model/app/widget/resusable_globle_widget/resusable_globle_widget/base_button.dart';
import 'package:fluuter_model/app/widget/resusable_globle_widget/resusable_globle_widget/base_text_form_field.dart';
import 'package:fluuter_model/core/themes/app_color.dart';
import 'package:fluuter_model/core/values/values_constant.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorConstant.danger50,
      resizeToAvoidBottomInset: true,
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            width: screenSize.width,
            height: screenSize.height,
            decoration: const BoxDecoration(
              color: ColorConstant.greenTextColor,
              image: DecorationImage(
                image: ExactAssetImage('assets/images/img.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(22.0),
                bottomRight: Radius.circular(22.0),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  width: screenSize.width,
                  height: 250.0,
                  decoration: const BoxDecoration(
                    color: ColorConstant.greenTextColor,
                    image: DecorationImage(
                      image: ExactAssetImage('assets/images/img.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(22.0),
                      bottomRight: Radius.circular(22.0),
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 200.0,
            right: 16.0,
            left: 16.0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              width: screenSize.width,
              // height: 170.0,
              decoration: BoxDecoration(
                color: ColorConstant.neutral50.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseTextFormField(
                    hintText: "Email",
                  ),
                  Divider(
                    height: 0.0,
                    thickness: 0.1,
                    color: ColorConstant.blueBackgroundBadge,
                  ),
                  BaseTextFormField(
                    hintText: "Password",
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 300.0,
            right: 0.0,
            child: Row(
              children: [
                const Text("Forget password"),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    width: 10,
                    height: 10,
                    child: Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 350.0,
            right: 4.0,
            left: 4.0,
            child: BaseButton(
              backgroundStatusButton: ColorConstant.danger50.withOpacity(0.5),
              labelStatus: "Login",
              height: AppHeight.h45,
              onTap: () {
                debugPrint('Hello word');
                Get.to(
                  () => const DashboardView(),
                  transition: Transition.zoom,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
