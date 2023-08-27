import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluuter_model/app/widget/resusable_globle_widget/resusable_globle_widget/base_loading.dart';
import 'package:fluuter_model/core/extensions/state_load.dart';
import 'package:fluuter_model/core/themes/app_color.dart';
import 'package:fluuter_model/core/utils/enum.dart';
import 'package:fluuter_model/core/values/values_constant.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.status,
    this.label,
    this.successWidget,
    this.errorWidget,
    this.loadingWidget,
    required this.onTap,
    this.backgroundStatusButton,
    this.height = AppHeight.h50,
    this.labelStatus = "Button",
  }) : super(key: key);
  final String? status;
  final String? label;
  final Widget? successWidget;
  final Widget? errorWidget;
  final Widget? loadingWidget;
  final Color? backgroundStatusButton;
  final VoidCallback onTap;
  final double height;
  final String labelStatus;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      width: size.width,
      height: height,
      decoration: BoxDecoration(
        color: status == StateIdle.loading.getStatus
            ? ColorConstant.danger50
            : status == StateIdle.success.getStatus
                ? ColorConstant.white
                : status == StateIdle.error.getStatus
                    ? ColorConstant.redColor
                    : ColorConstant.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          textStyle: const TextStyle(color: Colors.red
              // fontStyle: FontStyle.italic,
              ),
        ),
        onPressed: () {
          if (status == StateIdle.loading.getStatus) {
            log("Loading...");
            onTap();
          } else if (status == StateIdle.error.getStatus) {
            log("Error...");
            onTap();
          } else if (status == StateIdle.success.getStatus) {
            log("Success...");
            onTap();
          } else {
            onTap();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.zero,
          width: size.width,
          height: AppHeight.h50,
          alignment: Alignment.center,
          child: status == StateIdle.loading.getStatus
              ? loadingWidget ?? const BaseLoading()
              : status == StateIdle.error.getStatus
                  ? errorWidget ??
                      const Text(
                        "Error",
                        style: TextStyle(
                          color: ColorConstant.redColor,
                          fontWeight: FontWeight.w700,
                          fontSize: AppSize.s18,
                        ),
                      )
                  : status == StateIdle.success.getStatus
                      ? successWidget ??
                          const Text(
                            "Success",
                            style: TextStyle(
                              color: ColorConstant.greenTextColor,
                              fontWeight: FontWeight.w700,
                              fontSize: AppSize.s18,
                            ),
                          )
                      : Text(
                          labelStatus,
                          style: const TextStyle(
                            color: ColorConstant.neutral900,
                            fontWeight: FontWeight.w400,
                            fontSize: AppSize.s18,
                          ),
                        ),
        ),
      ),
    );
  }
}
