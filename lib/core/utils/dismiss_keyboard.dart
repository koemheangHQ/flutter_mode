import 'package:flutter/material.dart';
import 'package:fluuter_model/core/tools/hide_keyboard.dart';

class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CloseKeyboardManger.onCloseKeyboard(),
      child: child,
    );
  }
}
