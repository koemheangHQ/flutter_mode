import 'package:flutter/material.dart';
import 'package:fluuter_model/app/modules/profile/widget/widget.dart';
import 'package:get/get.dart';

class ProfileDetail extends StatelessWidget {
  const ProfileDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryTextColor,
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight),
          child: SingleChildScrollView(
            child: Container(
              width: AppSize.initializeWidth(context),
              height: AppSize.initializeHeight(context),
              color: ColorConstant.primaryTextColor,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      decoration: const BoxDecoration(
                        color: ColorConstant.danger,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      width: AppSize.initializeWidth(context),
                      height: AppSize.initializeHeight(context),
                      child: const Text("PLease intent content on this "),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.topCenter,
        height: 70,
        color: ColorConstant.primaryTextColor,
        child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.ac_unit,
              color: ColorConstant.danger,
              size: 40,
            )),
      ),
    );
  }
}
