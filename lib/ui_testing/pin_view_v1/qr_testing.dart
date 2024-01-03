import 'package:flutter/material.dart';
import 'package:fluuter_model/ui_testing/pin_view/circle.dart';
import 'package:fluuter_model/ui_testing/pin_view_v1/pin_keyboard_widget.dart';
import 'package:fluuter_model/ui_testing/pin_view_v1/shake_widget.dart';

class QrTesting extends StatefulWidget {
  const QrTesting({super.key});

  @override
  State<QrTesting> createState() => _QrTestingState();
}

class _QrTestingState extends State<QrTesting> {
  double scale = 1.0;
  double keyboardWidth = 300.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Transform.scale(
              scale: scale,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      child: const Text("Lock",
                          style: TextStyle(color: Colors.white))),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Enter your PIN code to unlock",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    height: 40,
                    child: ShakeWidget(
                      // key: controller.shakeKey,
                      shakeOffset: 4,
                      shakeCount: 4,
                      shakeDuration: const Duration(milliseconds: 700),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildCircles(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          // Text('data', style: TextStyle(color: Colors.white)),

          Container(
            // padding: const EdgeInsets.only(bottom: 36.0),
            constraints: BoxConstraints(maxWidth: keyboardWidth),
            child: PinKeyboardWidget(
              onDelete: () {
                //onDeleteButtonPressed();
              },
              onDigitTap: (digit) {
                //onKeyboardButtonPressed(context, digit);
              },
              onReset: () {
                //onReset();
              },
            ),
          ),
        ],
      ),
    );
  }

  String enteredPasscode = '';
  final CircleUIConfig circleUIConfig =
      const CircleUIConfig(circleSize: 24.0, borderWidth: 2);
  int passwordDigits = 4;
  void onKeyboardButtonPressed(String text) {
    setState(
      () {
        if (enteredPasscode.length < passwordDigits) {
          enteredPasscode += text;
          if (enteredPasscode.length == passwordDigits) {}
        }
      },
    );
  }

  List<Widget> _buildCircles() {
    var list = <Widget>[];
    var config = circleUIConfig;
    var extraSize = 0.0; // animation.value;
    for (int i = 0; i < passwordDigits; i++) {
      list.add(
        Container(
          margin: const EdgeInsets.all(8),
          child: Circle(
            filled: i < enteredPasscode.length,
            circleUIConfig: config,
            extraSize: extraSize,
          ),
        ),
      );
    }
    return list;
  }
}
