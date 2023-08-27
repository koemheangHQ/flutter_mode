import 'package:flutter/material.dart';
import 'package:fluuter_model/app/data/model/env_model.dart';

class Environment {
  Environment._internal();
  static final Environment _singleton = Environment._internal();
  static Environment get shared {
    return _singleton;
  }

  EnvironmentModel? data;
  static Locale mapLocale() {
    switch (Environment.shared.data?.language) {
      case "KH":
        return const Locale("km", "KH");
      case "EN":
        return const Locale("en", "EN");
      case "CH":
        return const Locale("ch", "CH");
      default:
        return const Locale("en", "EN");
    }
  }
}
