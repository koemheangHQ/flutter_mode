import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluuter_model/core/themes/app_color.dart';

class ShareTapView extends StatefulWidget {
  const ShareTapView({super.key});

  @override
  State<ShareTapView> createState() => _ShareTapViewState();
}

class _ShareTapViewState extends State<ShareTapView> {
  //create fun sum number a + b
  int sumNumber(int a, int b) {
    return a + b;
  }

  //create button share TextFormFiled
  Widget _buildShareTextFormFiled() {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: ColorConstant.redColor,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(width: 2.0, color: ColorConstant.warning500),
        image: const DecorationImage(
          image: NetworkImage(
            "https://i.insider.com/657afdb950edbc52a8642002?width=700",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
  //create button login
  Widget _buildShareButton() {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: ColorConstant.redColor,
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(width: 2.0, color: ColorConstant.warning500),
        image: const DecorationImage(
          image: NetworkImage(
            "https://i.insider.com/657afdb950edbc52a8642002?width=700",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: ColorConstant.orangeColorAvatar,
      child: Column(
        children: [
             //create widget for share

        ],
      ),
    );
  }
}
