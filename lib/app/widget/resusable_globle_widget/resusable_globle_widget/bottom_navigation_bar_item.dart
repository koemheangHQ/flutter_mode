import 'package:flutter/material.dart';

class BottomNavigationBarItem extends StatelessWidget {
  final IconData iconData;
  final String label;
  const BottomNavigationBarItem(
      {Key? key, required this.iconData, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBarItem(
      label: label,
      iconData: iconData,
    );
  }
}
