import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluuter_model/app/modules/auth/controller/auth_controller.dart';
import 'package:fluuter_model/app/widget/resusable_globle_widget/resusable_globle_widget/base_button.dart';
import 'package:fluuter_model/app/widget/resusable_globle_widget/resusable_globle_widget/base_text_form_field.dart';
import 'package:fluuter_model/core/themes/app_color.dart';
import 'package:fluuter_model/core/values/values_constant.dart';
import 'package:fluuter_model/route/pages/pages.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Scaffold(
          backgroundColor: ColorConstant.danger50,
          resizeToAvoidBottomInset: true,
          body: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              /*
              Container(
                width: screenSize.width,
                height: screenSize.height,
                decoration: const BoxDecoration(
                  color: ColorConstant.greenTextColor,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0XFF65C7F7),
                      Color(0XFF0052D4),
                    ],
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
              */
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
                      /*
                      decoration: const BoxDecoration(
                        color: ColorConstant.greenTextColor,
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0XFF0052D4),
                            Color(0XFF65C7F7),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22.0),
                          bottomRight: Radius.circular(22.0),
                        ),
                      ),
                      */
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.0)),
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
                    width: screenSize.width,
                    decoration: BoxDecoration(
                      // color: ColorConstant.neutral50.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BaseTextFormField(
                            txtController: controller.ctrlUserName,
                            hintText: "Email",
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please input your email';
                              } else if (value.trim().isNotEmpty) {
                                return null;
                              }
                            },
                          ),
                          /*
                          const Divider(
                            height: 0.0,
                            thickness: 0.1,
                            color: ColorConstant.blueBackgroundBadge,
                          ),
                          */
                          BaseTextFormField(
                            txtController: controller.ctrlPassword,
                            hintText: "Password",
                            prefixIcon: const Icon(Icons.lock),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please input your password';
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                top: 340.0,
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
                          value: controller.isCheck,
                          onChanged: (value) => controller.checkBox(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 400.0,
                right: 4.0,
                left: 4.0,
                child: BaseButton(
                  backgroundStatusButton:
                      ColorConstant.danger50.withOpacity(0.5),
                  labelStatus: "Submit",
                  height: AppHeight.h45,
                  onTap: () => controller.isLogin,
                ),
              ),
              Positioned(
                top: 400.0,
                right: 4.0,
                left: 4.0,
                child: BaseButton(
                  backgroundStatusButton:
                      ColorConstant.danger50.withOpacity(0.5),
                  labelStatus: "Submit",
                  height: AppHeight.h45,
                  onTap: () {
                    Get.toNamed(Pages.todos);
                    // Get.toNamed(Pages.profileView);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
