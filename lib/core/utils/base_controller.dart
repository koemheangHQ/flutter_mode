import 'package:get/get.dart';

class BaseController extends GetxController {
  bool isLoading = false;
  bool isError = false;
  bool isToggle = false;
  onToggle() {
    isToggle = !isToggle;
    update();
  }
}
