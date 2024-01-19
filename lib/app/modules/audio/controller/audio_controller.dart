import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class AudioController extends GetxController with WidgetsBindingObserver {
  final _audio = AudioPlayer();
  final _audioPosition = 0.obs;
  final _audioDuration = 0.obs;
  @override
  void onInit() {
    initAudio();
    super.onInit();
  }
  @override
  void onClose() {

    super.onClose();
  }
  @override
  void dispose() {
    _audio.dispose();
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.paused) {
      _audio.pause();
    }
    super.didChangeAppLifecycleState(state);
  }
  void initAudio() async {
    await _audio.setAsset('https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3');
    _audioDuration.value = 1000;
    _audio.positionStream.listen((event) {
      _audioPosition.value = event.inMilliseconds;
    }, onError: (Object e, StackTrace stackTrace) {
      log('A stream error occurred: $e');
    });
    update();
  }
  /// feature of rx_dart to combine the 3 streams of interest into one.
}