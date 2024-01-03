// import 'package:args/command_runner.dart';
// import 'package:ff/helpers.dart';
//
// class SetAppIdCommand extends Command {
//   @override
//   String get description =>
//       'Set bundle ID for ios and package name for Android.';
//
//   @override
//   String get name => 'set-appid';
//
//   SetAppIdCommand() {
//     argParser.addOption('android',
//         abbr: 'a',
//         mandatory: false,
//         help: 'Android package name. If not set, will not affect anything.');
//     argParser.addOption('ios',
//         abbr: 'i',
//         mandatory: false,
//         help: 'iOS app ID. If not set, will not affect anything.');
//   }
//
//   @override
//   void run() async {
//     final String? packageName = argResults?['android'];
//     final String? bundleId = argResults?['ios'];
//
//     if (packageName == null && bundleId == null) {
//       printWarning('Nothing changed!!');
//       return;
//     }
//
//     await setAppId(packageName, bundleId);
//   }
//
//   static Future setAppId(String? packageName, String? bundleId) async {
//     if (bundleId != null) {
//       await replaceFile(
//         RegExp(r'PRODUCT_BUNDLE_IDENTIFIER *= *[^;]+;'),
//         (match) {
//           if (match.group(0)!.endsWith('.RunnerTests;')) {
//             return 'PRODUCT_BUNDLE_IDENTIFIER = $bundleId.RunnerTests;';
//           }
//           return 'PRODUCT_BUNDLE_IDENTIFIER = $bundleId;';
//         },
//         'ios/Runner.xcodeproj/project.pbxproj',
//       );
//     }
//
//     printSuccess('Update bundle ID successfully!');
//
//     if (packageName != null) {
//       await runScript('''
//       sed -i "" -E "s/  package=\\"[^\\"]+\\"/  package=\\"$packageName\\"/" "android/app/src/main/AndroidManifest.xml" &&
//       sed -i "" -E "s/  package=\\"[^\\"]+\\"/  package=\\"$packageName\\"/" "android/app/src/debug/AndroidManifest.xml" &&
//       sed -i "" -E "s/  package=\\"[^\\"]+\\"/  package=\\"$packageName\\"/" "android/app/src/profile/AndroidManifest.xml" &&
//       sed -i "" -E "s/  namespace \\"[^\\"]+\\"/  namespace \\"$packageName\\"/" "android/app/build.gradle" &&
//       sed -i "" -E "s/  applicationId \\"[^\\"]+\\"/  applicationId \\"$packageName\\"/" "android/app/build.gradle" &&
//       sed -i "" -E "s/package .+/package $packageName/" "android/app/src/main/kotlin/co/drtech/mpay_v3/MainActivity.kt"
// ''', 'Replace package name for android');
//     }
//   }
// }
