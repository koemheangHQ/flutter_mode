import 'dart:async';
import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_model/app/modules/tap_widget/media.dart';
import 'package:fluuter_model/app/modules/tap_widget/profile.dart';
import 'package:fluuter_model/app/modules/tap_widget/share.dart';
import 'package:fluuter_model/core/themes/app_color.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with GetSingleTickerProviderStateMixin {

  late TabController tabController;
  late ScrollController scrollViewController;
  final CarouselController carouselController = CarouselController();
  int indexTap = 0;
  int current = 0;
  List<Widget> listOfSilver = const [
    Tab(icon: Icon(Icons.account_box, color: ColorConstant.danger)),
    Tab(icon: Icon(Icons.history, color: ColorConstant.danger)),
    Tab(icon: Icon(Icons.history, color: ColorConstant.danger)),
  ];
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  List<Widget> listOfBodyTabView = [
    ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      addAutomaticKeepAlives: false,
      shrinkWrap: true,
      primary: false,
      itemCount: 100,
      itemBuilder: (context, index) {
        return Text("Data$index");
      },
    ),
  ];
  Widget? changeTap() {
    if (indexTap == 0) {
      return const ProfileTapView();
    } else if (indexTap == 1) {
      return const ShareTapView();
    } else if (indexTap == 2) {
      return const MediaTapView();
    }
    return null;
  }

  void checkIndex(int indexTapClick) {
    indexTap = indexTapClick;
   update();
  }

  Stream<int> generateFibonacci(int count) async* {
    int a = 0, b = 1;
    for (int i = 0; i < count; i++) {
      yield a;
      int temp = a + b;
      a = b;
      b = temp;
    }
  }
  void addData() async{
    Stream<int> fibonacciStream = generateFibonacci(5);
    await for (int value in fibonacciStream) {
      log('Fibonacci: $value');
    }
    update();
  }
  StreamController<int> broadcastController = StreamController<int>.broadcast();
  void listenStream() {
    broadcastController.stream.listen((event) {
      indexTap = event;
      log("message $event");

      update();
    });
  }
  @override
  void onInit() {
    tabController = TabController(vsync: this, length: listOfSilver.length);
    scrollViewController = ScrollController(initialScrollOffset: 0.0);
    addData();
    super.onInit();
  }
  @override
  void onClose() {
    tabController.dispose();
    scrollViewController.dispose();
    super.onClose();
  }
}