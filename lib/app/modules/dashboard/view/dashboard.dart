import 'dart:async';
import 'dart:math';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_model/core/tools/data_time.dart';
import 'package:fluuter_model/core/utils/base_list_view.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../../core/utils/base_appbar.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late Rect region;
  late PaletteGenerator paletteGenerator;
  Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> subscription;
  ConnectivityResult connectivityResult = ConnectivityResult.none;
  List colors = [Colors.red, Colors.green, Colors.yellow];
  Random random = Random();
  int index = 0;
  bool startAnimation = false;
  void changeColor() {
    setState(() {
      index = random.nextInt(3);
    });
  }

  void listenConnectivity() {
    subscription = connectivity.onConnectivityChanged.listen(
      (result) {
        setState(
          () {
            connectivityResult = result;
            debugPrint("Message of connectivityResult: $connectivityResult");
          },
        );
      },
    );
  }

  void bindingWidget() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  void initState() {
    bindingWidget();
    listenConnectivity();
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  late final PageController _pageController = PageController()
    ..addListener(_handlePageChanged);
  final ValueNotifier<int> _currentPage = ValueNotifier(0);
  void _handlePageChanged() {
    int newPage = _pageController.page?.round() ?? 0;
    _currentPage.value = newPage;
  }

  @override
  Widget build(BuildContext context) {
    BaseSingleton.resultBaseSingleton.convertDataTime();
    return Scaffold(
      appBar: BaseAppBar(
        backgroundColor: colors[index],
        automaticallyImplyLeading: true,
        titleAppBar: 'Hello World',
        centerTitle: true,
        elevation: 0.0,
        onClick: () {
          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              startAnimation = true;
            });
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BaseListViewBuilder(
              listItem: const [1, 2, 3, 4, 5, 5, 6, 7, 8, 9, 10, 11],
              startAnimation: startAnimation,
              onTap: (value) {
                debugPrint("message of value: $value");
                value == 1 ? changeColor() : null;
                // value == 1 ? Get.toNamed(Pages.auth) : null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
