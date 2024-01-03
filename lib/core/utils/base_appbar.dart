import 'package:flutter/material.dart';
import 'package:fluuter_model/core/themes/app_color.dart';
import 'package:fluuter_model/core/utils/circle_button.dart';

class BaseAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? leading;
  final double? leadingWidth;
  final bool centerTitle;
  final List<Widget>? action;
  final double elevation;
  final Color backgroundColor;
  final bool automaticallyImplyLeading;
  final String? titleAppBar;
  final TextStyle? textStyleAppBar;
  final Function? onClick;
  const BaseAppBar({
    super.key,
    this.leading,
    this.leadingWidth,
    this.centerTitle = false,
    this.action,
    this.elevation = 1.0,
    this.backgroundColor = ColorConstant.orangeColor,
    this.automaticallyImplyLeading = false,
    this.titleAppBar,
    this.textStyleAppBar,
    this.onClick,
  });

  @override
  State<BaseAppBar> createState() => _BaseAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BaseAppBarState extends State<BaseAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.titleAppBar ?? 'N/A'),
      elevation: widget.elevation,
      centerTitle: widget.centerTitle,
      backgroundColor: widget.backgroundColor,
      titleTextStyle: widget.textStyleAppBar,
      leading: widget.leading,
      leadingWidth: widget.leadingWidth,
      actions: widget.action ??
          [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                children: [
                  CircleButton(
                    onTap: () => widget.onClick,
                  )
                ],
              ),
            )
          ],
    );
  }
}
