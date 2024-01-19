import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_model/app/modules/profile/controller/profile_controller.dart';
import 'package:fluuter_model/app/widget/resusable_globle_widget/animated_text.dart';
import 'package:fluuter_model/core/themes/app_color.dart';
import 'package:fluuter_model/core/tools/app_size.dart';
import 'package:fluuter_model/core/utils/circle_button.dart';
import 'package:fluuter_model/route/pages/pages.dart';
import 'package:fluuter_model/widget/profile_widget.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ProfileTapView extends GetView<ProfileController> {
  const ProfileTapView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: controller,
      builder: (_) {
        return Material(
          elevation: 0.0,
          color: ColorConstant.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    alignment: Alignment.center,
                    width: AppSize.initializeWidth(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: AvatarProfile(
                                  isBorder: false,
                                  urlImage:
                                      "https://i.ibb.co/RNCkztc/PIA24343-03-Mars-Perseverance-Landing-Graphics-Orange-Rover.webp",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 2.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Putin",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        const SizedBox(width: 2.0),
                                        SizedBox(
                                          width: 16.0,
                                          height: 16.0,
                                          child: Lottie.asset(
                                              "assets/json/check.json"),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "just now",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: ColorConstant
                                                  .primaryTextColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        CircleButton(
                          width: 38.0,
                          height: 38.0,
                          background: ColorConstant.white.withOpacity(0.3),
                          iconData: const Icon(Icons.more_horiz_sharp),
                          onTap: () {
                            Platform.isAndroid
                                ? showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        Container(
                                      width: AppSize.initializeWidth(context),
                                      height:
                                          AppSize.initializeHeight(context) *
                                              0.3,
                                      color: Colors.white,
                                    ),
                                  )
                                : showCupertinoModalPopup(
                                    context: context,
                                    builder: (BuildContext context) => Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  top: 4.0, bottom: 8.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                color: ColorConstant
                                                    .revampDividerColor,
                                              ),
                                              width: 60.0,
                                              height: 8.0,
                                            ),
                                            CircleButton(
                                              background: ColorConstant.white,
                                              circularInkWell: 0.0,
                                              circularMaterial: 0.0,
                                              containerWidth: 0.0,
                                              width: AppSize.initializeWidth(
                                                  context),
                                              iconData: const Text("Title"),
                                              onTap: () => Get.back(),
                                            ),
                                            CircleButton(
                                              background: ColorConstant.white,
                                              circularInkWell: 0.0,
                                              circularMaterial: 0.0,
                                              containerWidth: 0.0,
                                              width: AppSize.initializeWidth(
                                                  context),
                                              iconData: const Text("subTitle"),
                                              onTap: () => Get.back(),
                                            ),
                                            CircleButton(
                                              background: ColorConstant.white,
                                              circularInkWell: 0.0,
                                              circularMaterial: 0.0,
                                              containerWidth: 0.0,
                                              width: AppSize.initializeWidth(
                                                  context),
                                              iconData: const Text("Heading"),
                                              onTap: () => Get.back(),
                                            ),
                                            CircleButton(
                                              background: ColorConstant.white,
                                              circularInkWell: 0.0,
                                              circularMaterial: 0.0,
                                              containerWidth: 0.0,
                                              width: AppSize.initializeWidth(
                                                  context),
                                              iconData:
                                                  const Text("subHeading"),
                                              onTap: () => Get.back(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    // child: Text(
                    //     "dataslfdkvsdn lsdhnsdkcmdskvnjk csdnksdjvksdlv skdvnksjdvnkjsd slkdnvksdnvjsdnvndsvlsdvnksdskdvlsdvksdvksdjklskfdvjidsjvisjdvkjsdlkvjsldjvlksdvdpshgvoigfdjobivdjfvoidshisdnvisdnvksdvsdfhvdhfvhdkjfvhdkvjsdkvskdvksdvkjshdkvhkdsvkshahvohvisdhidfjvsdkjvsdjhvifiewhfiwejfiowejoeirfjoiewrhfgioerheorifgjoerhg"),

                    child: AnimatedTextWithSeeMore(
                      text:
                          'dataslfdkvsdn lsdhnsdkcmdskvnjk csdnksdjvksdlv skdvnksjdvnkjsd slkdnvksdnvjsdnvndsvlsdvnksdskdvlsdvksdvksdjklskfdvjidsjvisjdvkjsdlkvjsldjvlksdvdpshgvoigfdjobivdjfvoidshisdnvisdnvksdvsdfhvdhfvhdkjfvhdkvjsdkvskdvksdvkjshdkvhkdsvkshahvohvisdhidfjvsdkjvsdjhvifiewhfiwejfiowejoeirfjoiewrhfgioerheorifgjoerhg',
                      maxLines: 3,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Pages.profileDetail);
                    },
                    child: SizedBox(
                      child: CarouselSlider(
                        items: controller.imgList
                            .map(
                              (e) => Image.network(
                                e,
                                fit: BoxFit.cover,
                              ),
                            )
                            .toList(),
                        options: CarouselOptions(
                          reverse: true,
                          height: AppSize.initializeWidth(context),
                          aspectRatio: 16 / 9,
                          viewportFraction: 1.0,
                          disableCenter: true,
                          enlargeFactor: 1,
                          enlargeCenterPage: false,
                          onPageChanged: (index, reason) {
                            controller.current = index;
                            controller.update();
                          },
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.imgList.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => controller.carouselController
                            .animateToPage(entry.key),
                        child: Container(
                          width: 6.0,
                          height: 6.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(controller.current == entry.key
                                      ? 0.8
                                      : 0.4)),
                        ),
                      );
                    }).toList(),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 8.0),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        TextButton(onPressed: () {}, child: const Text("Love")),
                        TextButton(
                            onPressed: () {}, child: const Text("Comment")),
                        TextButton(
                            onPressed: () {}, child: const Text("Share")),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: SizedBox(
                      width: AppSize.initializeWidth(context),
                      child: Row(
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: "liked by",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0),
                            ),
                            TextSpan(
                              text: " Jupyter10",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: ColorConstant.neutral900,
                                      fontSize: 14.0),
                            ),
                            TextSpan(
                              text: " and Others",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: ColorConstant.neutral900,
                                      fontSize: 14.0),
                            ),
                          ]))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 22.0, top: 4.0, bottom: 12.0),
                    child: SizedBox(
                      width: AppSize.initializeWidth(context),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "View",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.w300,
                                          color: ColorConstant.neutral900,
                                          fontSize: 12.0),
                                ),
                                TextSpan(
                                  text: " all",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.0),
                                ),
                                TextSpan(
                                  text: " 38",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.0),
                                ),
                                TextSpan(
                                  text: " comments",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 12.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: AppSize.initializeWidth(context),
                height: 10,
                color: ColorConstant.midLightGrey,
              ),
            ],
          ),
        );
      },
    );
  }
}
