import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluuter_model/core/themes/app_color.dart';
import 'package:fluuter_model/ui_testing/pin_view/keyboard_ui_config.dart';

class PinKeyboardWidget extends StatefulWidget {
  final Function(String) onDigitTap;
  final VoidCallback onReset;
  final VoidCallback onDelete;
  const PinKeyboardWidget({
    Key? key,
    required this.onDigitTap,
    required this.onReset,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<PinKeyboardWidget> createState() => _PinKeyboardWidgetState();
}

class _PinKeyboardWidgetState extends State<PinKeyboardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController keyAnimationController;
  late Animation<double> keyAnimation;

  @override
  void initState() {
    keyAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    keyAnimation = Tween(
      begin: 0.2,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: keyAnimationController,
        curve: Curves.easeInOutBack,
      ),
    );
    keyAnimationController.forward();
    super.initState();
  }

  final KeyboardUIConfig keyboardUIConfig = KeyboardUIConfig(
    digitBorderWidth: 0.5,
    digitFillColor: Colors.white.withOpacity(0.2),
    digitTextStyle: const TextStyle(
      fontSize: 36,
      color: ColorConstant.white,
      fontWeight: FontWeight.w500,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
      ),
      itemBuilder: (context, index) {
        if (index <= 8) {
          return _buildKeyboardDigit("${index + 1}");
        } else {
          if (index == 9) {
            return ScaleTransition(
              scale: keyAnimation,
              child: InkWell(
                onTap: () {
                  widget.onReset();
                  HapticFeedback.selectionClick();
                },
                borderRadius: BorderRadius.circular(100),
                child: Center(
                  child: Text(
                    "C",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 36,
                          color: ColorConstant.white,
                        ),
                  ),
                ),
              ),
            );
          } else if (index == 10) {
            return _buildKeyboardDigit("0");
          } else if (index == 11) {
            return ScaleTransition(
              scale: keyAnimation,
              child: InkWell(
                onTap: () {
                  widget.onDelete();
                  HapticFeedback.selectionClick();
                },
                borderRadius: BorderRadius.circular(100),
                child: const Center(child: Text('Delete')),
              ),
            );
          }
        }
        return const SizedBox();
      },
      itemCount: 12,
    );
  }

  Widget _buildKeyboardDigit(String text) {
    return ScaleTransition(
      scale: keyAnimation,
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ClipOval(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: keyboardUIConfig.primaryColor.withOpacity(0.4),
              onTap: () {
                debugPrint('Click on number $text');
                widget.onDigitTap(text);
                HapticFeedback.selectionClick();
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                      color: keyboardUIConfig.primaryColor,
                      width: keyboardUIConfig.digitBorderWidth),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: keyboardUIConfig.digitFillColor,
                  ),
                  child: Center(
                    child: Text(
                      text,
                      style: keyboardUIConfig.digitTextStyle,
                      semanticsLabel: text,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
