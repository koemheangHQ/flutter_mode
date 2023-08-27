import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDb {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  Future readPref(String key) async {
    var pref = await prefs;
    if (pref.getString(key) != null) {
      return null;
    } else {
      return json.decode(pref.getString(key)!);
    }
  }

  Future savePref(String key, value) async {
    var pref = await prefs;
    pref.setString(key, json.encode(value));
  }

  Future remove(String key) async {
    var pref = await prefs;
    pref.remove(key);
  }
}

class SharedPrefSingleton {
  static final SharedPrefSingleton _instance = SharedPrefSingleton._internal();
  factory SharedPrefSingleton() => _instance;
  SharedPrefSingleton._internal();
  late SharedPreferences _pref;

  Future<void> initialize() async {
    _pref = await SharedPreferences.getInstance();
  }

  /// set*
  Future<bool> setName(String name) => _pref.setString('name_key', name);

  Future write(String key) => _pref.setString('key', key);

  Future readSharePreference(String key) async =>
      await json.decode(_pref.getString(key)!);

  Future saveSharePreference(String key, value) async =>
      await _pref.setString(key, value);

  Future remove(String key) async => await _pref.remove(key);

  /// get*
  String get name => _pref.getString('key') ?? '';

  bool get getBool => _pref.getBool('key') ?? false;

  int get getInt => _pref.getInt('key') ?? 0;

  double get getDouble => _pref.getDouble('key') ?? 0.0;
}
