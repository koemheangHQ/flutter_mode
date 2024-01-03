import 'package:flutter/material.dart';

class CloseKeyboardManger {
  static onCloseKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
