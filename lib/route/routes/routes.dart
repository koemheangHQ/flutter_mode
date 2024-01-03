import 'package:flutter/material.dart';
import 'package:fluuter_model/app/modules/auth/binding/auth_binding.dart';
import 'package:fluuter_model/app/modules/auth/view/auth.dart';
import 'package:fluuter_model/app/modules/dashboard/view/dashboard.dart';
import 'package:fluuter_model/app/modules/profile/binding/profile_binding.dart';
import 'package:fluuter_model/app/modules/profile/view/profile_detail.dart';
import 'package:fluuter_model/app/modules/profile/view/profile_view.dart';
import 'package:fluuter_model/app/modules/todo/binding/todo_binding.dart';
import 'package:fluuter_model/app/modules/todo/view/detail_write.dart';
import 'package:fluuter_model/app/modules/todo/view/todo_view.dart';
import 'package:fluuter_model/app/modules/weather/weather_module.dart';
import 'package:fluuter_model/route/pages/pages.dart';
import 'package:fluuter_model/ui_testing/handle_status_bar.dart';
import 'package:fluuter_model/ui_testing/list_with_aligment.dart';
import 'package:fluuter_model/ui_testing/material_three.dart';
import 'package:fluuter_model/ui_testing/my_widget.dart';
import 'package:fluuter_model/ui_testing/overlay.dart';
import 'package:fluuter_model/ui_testing/pin_view/pin_code.dart';
import 'package:fluuter_model/ui_testing/pin_view_v1/bindding.dart';
import 'package:fluuter_model/ui_testing/pin_view_v1/pin_code.dart';
import 'package:fluuter_model/ui_testing/pin_view_v1/qr_testing.dart';
import 'package:fluuter_model/ui_testing/test_draggable_float_widget.dart';
import 'package:fluuter_model/ui_testing/test_easy_draggable.dart';
import 'package:fluuter_model/ui_testing/test_model.dart';
import 'package:fluuter_model/ui_testing/test_pip_view.dart';
import 'package:fluuter_model/ui_testing/test_ui_from_gpt.dart';
import 'package:fluuter_model/ui_testing/testing_animation.dart';
import 'package:fluuter_model/ui_testing/web_view.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> pages = [
    GetPage(
      name: Pages.auth,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Pages.dashboard,
      page: () => const DashboardView(),
      transition: Transition.zoom,
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
    ),
    GetPage(
      name: Pages.listWithAlignment,
      page: () => const ListWithAlignment(),
    ),
    GetPage(
      name: Pages.webView,
      page: () => const WebViewExample(),
    ),
    GetPage(
      name: Pages.pinCodeView,
      page: () => const PinCodeView(),
    ),
    GetPage(
      name: Pages.pinCode,
      page: () => const PinCode(),
      binding: PinCodeBinding(),
    ),
    GetPage(
      name: Pages.qrTesting,
      page: () => const QrTesting(),
    ),
    GetPage(
      name: Pages.weather,
      page: () => const WeatherModule(),
    ),
    GetPage(
      name: Pages.materialThree,
      page: () => const MaterialThree(),
    ),
    GetPage(
      name: Pages.profileView,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Pages.todos,
      page: () => const TodoView(),
      transition: Transition.noTransition,
      binding: TodoBinding(),
    ),
    GetPage(
      name: Pages.writeDetail,
      page: () => const DetailWrite(),
      transition: Transition.noTransition,
      binding: TodoBinding(),
    ),
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
