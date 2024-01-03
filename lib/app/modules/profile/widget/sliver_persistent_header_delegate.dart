import 'package:flutter/material.dart';

class SliverTabBarViewDelegate extends SliverPersistentHeaderDelegate {
  SliverTabBarViewDelegate({
    required this.child,
    this.elevation = 200,

  });

  final Widget child;
  final double? elevation;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      elevation:elevation!,
      child: child,
    );
  }

  @override
  double get maxExtent => kTextTabBarHeight;

  @override
  double get minExtent => kTextTabBarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}