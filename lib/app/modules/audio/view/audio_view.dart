import 'package:flutter/material.dart';
import 'package:fluuter_model/app/modules/audio/controller/audio_controller.dart';
import 'package:fluuter_model/core/utils/base_appbar.dart';
import 'package:get/get.dart';

class AudioSoundView extends GetView<AudioController> {
  const AudioSoundView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BaseAppBar(
        centerTitle: true,
        titleAppBar: 'Audio',
      ),
    );
  }
}
