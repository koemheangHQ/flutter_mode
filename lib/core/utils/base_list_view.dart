import 'package:flutter/material.dart';
import 'package:fluuter_model/core/themes/app_color.dart';

class BaseListViewBuilder<T> extends StatelessWidget {
  final List<T> listItem;
  final Function(int index) onTap;
  final bool startAnimation;
  const BaseListViewBuilder({
    super.key,
    required this.listItem,
    required this.onTap,
    this.startAnimation = false,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: listItem.length,
        itemBuilder: (context, index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300 + (index * 100)),
            transform: Matrix4.translationValues(
                startAnimation ? 0 : screenWidth, 0, 0),
            child: Material(
              color: index.isEven
                  ? ColorConstant.purpleColorOrderStatus.withOpacity(0.1)
                  : ColorConstant.white,
              child: InkWell(
                onTap: () => onTap(index),
                child: ListTile(
                  title: Text('Title$index'),
                  subtitle: const Text('Sub Title'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
