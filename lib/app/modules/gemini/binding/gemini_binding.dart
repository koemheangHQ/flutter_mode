import 'package:fluuter_model/app/modules/gemini/controller/gemini_controller.dart';
import 'package:get/get.dart';

class GeminiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GeminiController>(() => GeminiController());
  }
}