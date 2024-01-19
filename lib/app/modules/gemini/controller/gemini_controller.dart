import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:fluuter_model/app/data/model/gemini/gemini_model.dart';
import 'package:fluuter_model/app/data/providers/gemini_provider.dart';
import 'package:get/get.dart';

class GeminiController extends GetxController {
   bool isClear = false;
   final TextEditingController txtInputCtrl = TextEditingController();
   final GeminiProvider geminiProvider = GeminiProvider();
   List<Part> listPart = [];
   bool isLoading = false;
   bool isError = false;

   @override
  void onInit() {
      //getResponseGemini();
    super.onInit();
  }

  void getResponseGemini({required String value}) async {
    try {
      isLoading = true;
      final response = await geminiProvider.getGeminiResponse(text: txtInputCtrl.text);
      listPart = response;
      isLoading = false;
    } catch (error) {
      isLoading = false;
      isError = true;
    }
    update();
  }
  void clearTxtInput() {
     if(txtInputCtrl.text.isNotEmpty) {
       sendData();
       txtInputCtrl.clear();
     }
    update();
  }
  void sendData() {
    if(txtInputCtrl.text.isNotEmpty) getResponseGemini(value: txtInputCtrl.text);

    update();
  }
}