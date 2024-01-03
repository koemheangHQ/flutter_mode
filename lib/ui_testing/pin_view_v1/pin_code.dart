/*
 * File: pin_code.dart
 * Project: Wingmarket
 * File Created: Tuesday, 23rd August 2022 1:55:55 pm
 * Author: Sokunviseth Por (sokunviseth.por@wingmoney.com)
 * -----
 * Copyright (c) 2022 Wing Bank
 */

import 'package:flutter/material.dart';
import 'package:fluuter_model/app/widget/resusable_globle_widget/resusable_globle_widget/base_button.dart';
import 'package:fluuter_model/core/themes/app_color.dart';
import 'package:fluuter_model/ui_testing/pin_view/circle.dart';
import 'package:fluuter_model/ui_testing/pin_view_v1/pin_code_controller.dart';
import 'package:fluuter_model/ui_testing/pin_view_v1/shake_widget.dart';
import 'package:get/get.dart';

class PinCode extends GetView<PinCodeController> {
  const PinCode({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    double keyboardWidth = 300.0;
    double scale = 1.0;

    if (width >= 414.0) {
      keyboardWidth = 320.0;
      scale = 1.0;
    } else if (width < 414.0 && width >= 375.0) {
      keyboardWidth = 300.0;
      scale = 1.0;
      if (height < 700) {
        scale = 0.85;
        keyboardWidth = 260.0;
      }
    } else {
      keyboardWidth = 250.0;
      scale = 0.7;
    }

    return GetBuilder<PinCodeController>(
      init: controller,
      builder: (_) {
        return Material(
            color: Colors.amberAccent,
            child: FadeTransition(
              opacity: Tween(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: controller.slideAnimationController,
                  curve: Curves.easeIn,
                ),
              ),
              // opacity: controller.slideAnimation,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.red,
                  leading: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: BaseButton(
                          label: "Cancel",
                          onTap: () => Get.back(),
                        ),
                      ),
                    ],
                  ),
                  leadingWidth: 120,
                ),
                backgroundColor: Colors.black,
                body: SafeArea(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.red,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Transform.scale(
                              scale: scale,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Lock"),
                                  const SizedBox(
                                    height: 16.0,
                                  ),
                                  Text(
                                    "enter_pin_code".tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 270),
                                    child: Text(
                                      "${"please_enter_pin_code_for_account".tr} ${"to_continue".tr}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: ColorConstant.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  // Container(
                                  //   margin: const EdgeInsets.only(top: 8),
                                  //   height: 40,
                                  //   child: ShakeWidget(
                                  //     key: controller.shakeKey,
                                  //     shakeOffset: 4,
                                  //     shakeCount: 4,
                                  //     shakeDuration:
                                  //         const Duration(milliseconds: 700),
                                  //     child: Row(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.center,
                                  //       children: _buildCircles(),
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            ),
                          ),
                          // Container(
                          //   padding: const EdgeInsets.only(bottom: 36.0),
                          //   constraints:
                          //       BoxConstraints(maxWidth: keyboardWidth),
                          //   child: PinKeyboardWidget(
                          //     onDelete: () {
                          //       controller.onDeleteButtonPressed();
                          //     },
                          //     onDigitTap: (digit) {
                          //       controller.onKeyboardButtonPressed(
                          //           context, digit);
                          //     },
                          //     onReset: () {
                          //       controller.onReset();
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )

            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            //   color: Colors.red,
            //   child: const Text('data'),
            // ),
            );
      },
    );
  }

  List<Widget> _buildCircles() {
    var list = <Widget>[];
    var config = controller.circleUIConfig;
    var extraSize = 0.0; // animation.value;
    for (int i = 0; i < controller.passwordDigits; i++) {
      list.add(
        Container(
          margin: const EdgeInsets.all(8),
          child: Circle(
            filled: i < controller.enteredPasscode.length,
            circleUIConfig: config,
            extraSize: extraSize,
          ),
        ),
      );
    }
    return list;
  }
}
