class App {
  App._internal();
  static final App _singleton = App._internal();
  static App get shared {
    return _singleton;
  }

  String appVersion = '';
  String deviceModel = '';
  String uuid = '';
}
