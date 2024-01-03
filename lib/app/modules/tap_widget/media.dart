import 'package:flutter/material.dart';
import 'package:fluuter_model/core/themes/app_color.dart';

class MediaTapView extends StatefulWidget {
  const MediaTapView({super.key});

  @override
  State<MediaTapView> createState() => _MediaTapViewState();
}

class _MediaTapViewState extends State<MediaTapView> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      color: ColorConstant.orangeColorAvatar,
      child: Column(
        children: [

        ],
      ),
    );
  }
}
