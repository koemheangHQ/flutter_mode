import 'package:flutter/material.dart';
import 'package:fluuter_model/app/modules/auth/view/auth.dart';
import 'package:fluuter_model/app/modules/dashboard/view/auth.dart';
import 'package:fluuter_model/route/pages/pages.dart';
import 'package:fluuter_model/ui_testing/handle_status_bar.dart';
import 'package:fluuter_model/ui_testing/my_widget.dart';
import 'package:fluuter_model/ui_testing/overlay.dart';
import 'package:fluuter_model/ui_testing/test_draggable_float_widget.dart';
import 'package:fluuter_model/ui_testing/test_easy_draggable.dart';
import 'package:fluuter_model/ui_testing/test_model.dart';
import 'package:fluuter_model/ui_testing/test_pip_view.dart';
import 'package:fluuter_model/ui_testing/test_ui_from_gpt.dart';
import 'package:fluuter_model/ui_testing/testing_animation.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> pages = [
    GetPage(
      name: Pages.auth,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: Pages.dashboard,
      page: () => const DashboardView(),
    ),
    GetPage(
      name: Pages.testPipView,
      page: () => const TestPipView(),
    ),
    GetPage(
      name: Pages.testDraggableFloatWidget,
      page: () => const TestDraggableFloatWidget(),
    ),
    GetPage(
      name: Pages.draggableVideoCall,
      page: () => DraggableVideoCall(),
    ),
    GetPage(
      name: Pages.testEasyDraggable,
      page: () => const TestEasyDraggable(title: 'Testing draggable'),
    ),
    GetPage(
      name: Pages.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Pages.physicsCardDragDemo,
      page: () => const PhysicsCardDragDemo(),
    ),
    GetPage(
      name: Pages.testModel,
      page: () => const TestModel(),
    ),
    GetPage(
      name: Pages.testOverlay,
      page: () => const OverlayTest(),
    ),
    GetPage(
      name: Pages.handleStatusBar,
      page: () => const HandleStatusBar(),
    )
  ];
  static GetPage unknownRoute = GetPage(
    name: Pages.unknown,
    page: () => const UnknownView(),
  );
}

class UnknownView extends StatelessWidget {
  const UnknownView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
