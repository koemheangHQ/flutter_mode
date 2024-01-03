// import 'package:args/command_runner.dart';
// import 'package:ff/helpers.dart';
//
// class SetAppVersionCommand extends Command {
//   @override
//   String get description => 'Set app version and build number manually or follow ff.yaml';
//
//   @override
//   String get name => 'set-version';
//
//   SetAppVersionCommand() {
//     argParser.addOption('version', abbr: 'v');
//     argParser.addOption('build', abbr: 'b');
//   }
//
//   @override
//   void run() async {
//     final config = await getConfig();
//
//     final String versionName = argResults?['version'] ?? config['build_settings']['version']['name'];
//     final String buildNumber = argResults?['build'] ?? config['build_settings']['version']['number'];
//
//     await setVersion(versionName, buildNumber);
//   }
//
//   static Future setVersion(String versionName, String buildNumber) async {
//     await runScript('''
// sed -i "" -E "s/^version\\: *.+/version: $versionName+$buildNumber/" pubspec.yaml
//
// #android
// sed -i "" -E "s/^flutter.versionName=.+/flutter.versionName=$versionName/" android/local.properties
// sed -i "" -E "s/^flutter.versionCode=.+/flutter.versionCode=$buildNumber/" android/local.properties
//
// #ios
// sed -i "" -E "s/FLUTTER_BUILD_NAME=[^\\"]+/FLUTTER_BUILD_NAME=$versionName/" ios/Flutter/flutter_export_environment.sh
// sed -i "" -E "s/FLUTTER_BUILD_NUMBER=[^\\"]+/FLUTTER_BUILD_NUMBER=$buildNumber/" ios/Flutter/flutter_export_environment.sh
//
// sed -i "" -E "s/FLUTTER_BUILD_NAME=[^\\"]+/FLUTTER_BUILD_NAME=$versionName/" ios/Flutter/Generated.xcconfig
// sed -i "" -E "s/FLUTTER_BUILD_NUMBER=[^\\"]+/FLUTTER_BUILD_NUMBER=$buildNumber/" ios/Flutter/Generated.xcconfig
//
// sed -i "" -E "s/MARKETING_VERSION = .+;/MARKETING_VERSION = $versionName;/g" ios/Runner.xcodeproj/project.pbxproj
// sed -i "" -E "s/CURRENT_PROJECT_VERSION = .+;/CURRENT_PROJECT_VERSION = $buildNumber;/g" ios/Runner.xcodeproj/project.pbxproj
//     ''', 'Update version and build number');
//   }
// }
