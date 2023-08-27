import 'package:flutter/services.dart';
import 'package:fluuter_model/core/values/constant.dart';

class MethodChannelManager {
  MethodChannelManager._();
  static const _channel = MethodChannel(ConstantsChannel.channel);
  static Future<dynamic> invokeMethod(
      {required String method, dynamic arguments}) async {
    return await _channel.invokeMethod(method, arguments);
  }
}
