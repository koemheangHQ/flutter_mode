enum Environment { dev, staging, pro }

class EnvironmentConstants {
  static String? _config;
  static String setEnvironment(Environment env) {
    switch (env) {
      case Environment.dev:
        _config = "https//www.eco.dev.com";
        break;
      case Environment.staging:
        _config = "https//www.eco.dev.staging";
        break;
      case Environment.pro:
        _config = "https//www.eco.dev.prod";
        break;
    }
    return _config!;
  }
}
