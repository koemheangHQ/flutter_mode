import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:fluuter_model/app/data/model/todo/todo_model.dart';
import 'package:get/get.dart';

class DetailWriteController extends GetxController {
   final resultAgr = Get.arguments;
   TodoResponse todoResponse  = TodoResponse(id: 1);
   final TextEditingController txtTitle = TextEditingController();
   @override
  void onInit() {

    log("message of resultAgr $resultAgr");
    super.onInit();
  }
  saveTodo() {
    log("todoResponse ${txtTitle.text.toString}");
     // todoResponse.title = txtTitle.text;
     // log("todoResponse.title ${todoResponse.title.toString()}");
    Get.back();
  }
}