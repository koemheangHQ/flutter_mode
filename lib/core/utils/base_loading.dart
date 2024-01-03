import 'package:flutter/material.dart';
import 'package:fluuter_model/core/themes/app_color.dart';
import 'package:fluuter_model/core/tools/app_size.dart';
import 'package:fluuter_model/core/utils/app_style.dart';
import 'package:fluuter_model/core/utils/enum.dart';

class BaseLoading extends StatelessWidget {
  final StateIdle stateIdle;
  const BaseLoading({
    super.key,
    required this.stateIdle,
  });

  @override
  Widget build(BuildContext context) {
    switch (stateIdle) {
      case StateIdle.error:
        return SafeArea(
          child: Container(
            alignment: Alignment.center,
            width: AppSize.initializeWidth(context),
            height: AppSize.initializeHeight(context),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Error',
                  style: AppStyle.textTheme.bodyLarge!.copyWith(
                    color: ColorConstant.danger,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
        );
      case StateIdle.loading:
        return SafeArea(
          top: false,
          bottom: false,
          child: Container(
            alignment: Alignment.center,
            width: AppSize.initializeWidth(context),
            height: AppSize.initializeHeight(context),
            color: Colors.transparent,
            child: const CircularProgressIndicator(
              color: ColorConstant.orangeColor,
            ),
          ),
        );
      case StateIdle.success:
        return const Text('Success');
    }
  }
}
