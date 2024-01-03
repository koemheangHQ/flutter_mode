import 'package:flutter/material.dart';
import 'package:fluuter_model/core/utils/base_controller.dart';
import 'package:fluuter_model/route/pages/pages.dart';
import 'package:get/get.dart';

class AuthController extends BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController ctrlUserName = TextEditingController();
  final TextEditingController ctrlPassword = TextEditingController();
  bool error = false;
  bool isCheck = false;
  @override
  void onInit() {
    //todo
    super.onInit();
  }

  bool get isLogin {
    if (formKey.currentState!.validate()) {
      Get.toNamed(Pages.dashboard);
    } else {
      Get.snackbar('Message', 'Please try again!');
    }
    return false;
  }

  void checkBox() {
    isCheck = !isCheck;
    update();
  }
}
