import 'package:flutter/material.dart';

extension IntX on int {
  Duration get minute => Duration(minutes: this);
  Duration get second => Duration(seconds: this);
  Duration get milliSecond => Duration(milliseconds: this);

  Widget get width => SizedBox(width: toDouble());
  Widget get height => SizedBox(height: toDouble());

  BorderRadius get radius => BorderRadius.circular(toDouble());
}
