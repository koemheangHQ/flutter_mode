import 'package:flutter/material.dart';
import 'package:fluuter_model/app/modules/profile/widget/widget.dart';
import 'package:get/get.dart';


class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileController>(
        init: controller,
        builder: (_) {
          return
            CustomScrollView(
              primary: false,
              shrinkWrap: true,
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarB(),
                ),
                SliverPadding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Row(
                          children: [
                            Text(
                              'Jupyter10',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: Lottie.asset("assets/json/check.json"),
                            )
                          ],
                        ),
                        const Text(
                            'Texts and header in own SliverList so that we can '
                                'scroll them with the scrolling grid. To get the '
                                'Padding effect, we must wrap each Sliver in a '
                                'SliverPadding!'),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverTabBarViewDelegate(
                    child: Container(
                      alignment: Alignment.center,
                      child: TabBar(
                        onTap: (value) {
                          controller.checkIndex(value);
                        },
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorColor: ColorConstant.danger,
                        indicatorWeight: 3.0,
                        controller: controller.tabController,
                        tabs: controller.listOfSilver,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) => controller.changeTap() ?? Container(),
                    childCount: 10,
                  ),
                ),
              ],
            );
        },
      ),
    );
  }
}