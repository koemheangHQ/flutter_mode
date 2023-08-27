import 'package:flutter/services.dart';

class MyTextInputFormatter {
  FilteringTextInputFormatter phoneRegExpFormatter =
      FilteringTextInputFormatter.allow(
    RegExp(r'^[(-\d+)]\d*[(.\d+)]?\d*'),
  );
}

/// Class regExp Email
class RegExpEmail {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
}
