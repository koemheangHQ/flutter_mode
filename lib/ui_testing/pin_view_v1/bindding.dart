import 'package:fluuter_model/ui_testing/pin_view_v1/pin_code_controller.dart';
import 'package:get/get.dart';

class PinCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinCodeController>(() => PinCodeController());
  }
}
