import 'dart:convert';
import 'dart:developer';

import 'package:easy_draggable/easy_draggable.dart';
import 'package:fluuter_model/app/data/model/gemini/gemini_model.dart';
import 'package:fluuter_model/app/dio_handler/dio_handler.dart';
import 'package:fluuter_model/core/values/base_url.dart';
import 'package:fluuter_model/core/values/key.dart';

class GeminiProvider {
  DioBaseHelper dioBaseHelper = DioBaseHelper();
  BaseUrl baseUrl = BaseUrl();
  Future<List<Part>> getGeminiResponse({required String text}) async {

    final response = await dioBaseHelper.post("${BaseUrl.baseUrl}key=$googleKey",text );
    if (response.statusCode == 200) {
      final resData = response.data['candidates'][0]['content'];
      final  contentsList = resData['parts'] as List;

      return contentsList.map((e) => Part.fromJson(e)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
