import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluuter_model/app/modules/profile/widget/widget.dart';

class SliverAppBarB extends SliverPersistentHeaderDelegate {
  final bottomHeight = 60;
  final extraRadius = 5;
  @override
  Widget build(context, shrinkOffset, overlapsContent) {
    final imageTop =
    -shrinkOffset.clamp(0.0, maxExtent - minExtent - bottomHeight);

    final double closingRate = (shrinkOffset == 0
        ? 0.0
        : (shrinkOffset / (maxExtent - minExtent - bottomHeight)))
        .clamp(0, 1);

    final double opacity = shrinkOffset == minExtent
        ? 0
        : 1 - (shrinkOffset.clamp(minExtent, minExtent + 30) - minExtent) / 30;

    return Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 20,
          left: 45,
          child: Row(
            children: [
              Transform.scale(
                scale: 1.9 - closingRate,
                alignment: Alignment.bottomCenter,
                child: const AvatarProfile(),
              ),
              const Spacer(),
              SizedBox(
                height: 35.0,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    side: const BorderSide(
                        color: ColorConstant.danger, width: 1.2),
                    foregroundColor: ColorConstant.neutral,
                  ),
                  child: const Text("Edit profile"),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: imageTop,
          left: 0,
          right: 0,
          child: ClipPath(
            clipper: InvertedCircleClipper(
              radius: (1.9 - closingRate) * bottomHeight / 2 + extraRadius,
              offset: Offset(
                bottomHeight / 2 + 45,
                (maxExtent - bottomHeight + extraRadius / 2) +
                    closingRate * bottomHeight / 2,
              ),
            ),
            child: SizedBox(
              height: maxExtent - bottomHeight,
              child: Container(
                width: AppSize.initializeWidth(context),
                height: AppSize.initializeHeight(context),
                color: Colors.redAccent,
                child: ColoredBox(
                  color: ColorConstant.colorGrey.withOpacity(0.5),
                  child: Image.network(
                    'https://i.ibb.co/RNCkztc/PIA24343-03-Mars-Perseverance-Landing-Graphics-Orange-Rover.webp',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 5,
          left: 10,
          right: 10,
          child: Row(
            children: [
              CircleButton(
                width: 38.0,
                height: 38.0,
                background: ColorConstant.white.withOpacity(0.3),
                iconData: const Icon(Icons.arrow_back),
                onTap: () {
                  log("message on click back");
                },
              ),
              const Spacer(),
              CircleButton(
                width: 38.0,
                height: 38.0,
                background: ColorConstant.white.withOpacity(0.3),
                iconData: const Icon(Icons.more_vert),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 260;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}