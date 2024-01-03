import 'package:flutter/material.dart';
import 'package:fluuter_model/ui_testing/pin_view/circle.dart';
import 'package:fluuter_model/ui_testing/pin_view_v1/shake_widget.dart';
import 'package:get/get.dart';

class PinCodeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController slideAnimationController;
  late Animation<double> slideAnimation;

  final shakeKey = GlobalKey<ShakeWidgetState>();
  final CircleUIConfig circleUIConfig =
      const CircleUIConfig(circleSize: 24.0, borderWidth: 2);
  int passwordDigits = 4;
  String enteredPasscode = '';

  onReset() {
    enteredPasscode = '';
    update();
  }

  onKeyboardButtonPressed(BuildContext context, String text) {
    if (enteredPasscode.length < passwordDigits) {
      enteredPasscode += text;
      if (enteredPasscode.length == passwordDigits) {
        // onPasscodeEntered(context, enteredPasscode);
      }
    }
    update();
  }

  onPinInputErrorState() {
    enteredPasscode = '';
    update();
    shakeKey.currentState!.shake();
    //Vibration.vibrate();
  }

  onDeleteButtonPressed() {
    if (enteredPasscode.isNotEmpty) {
      enteredPasscode =
          enteredPasscode.substring(0, enteredPasscode.length - 1);
      update();
    }
  }

  @override
  void onInit() {
    slideAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    slideAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: slideAnimationController,
        curve: Curves.easeIn,
      ),
    );
    super.onInit();
  }
}
