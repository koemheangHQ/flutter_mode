// import 'package:args/command_runner.dart';
// import 'package:ff/commands/set_app_id.dart';
// import 'package:ff/commands/set_app_name.dart';
// import 'package:ff/commands/set_deeplink_scheme.dart';
// import 'package:ff/helpers.dart';
//
// class SetEnvironmentCommand extends Command {
//   @override
//   String get description => 'Change environment to test or production.';
//
//   @override
//   String get name => 'set-env';
//
//   SetEnvironmentCommand() {
//     argParser.addOption(
//       'env',
//       abbr: 'e',
//       mandatory: true,
//       allowed: ['dev', 'test', 'prod'],
//       help:
//           '[dev] refer to developer version. \n[test] for build buy point to testing server. \n[prod] for release',
//     );
//   }
//
//   @override
//   void run() async {
//     var env = argResults?['env'];
//
//     await setEnv(env);
//   }
//
//   static Future setEnv(String env) async {
//     final config = await getConfig();
//     var devMode = false;
//
//     switch (env) {
//       case 'dev':
//         devMode = true;
//         break;
//       case 'test':
//         devMode = true;
//         break;
//       case 'prod':
//         devMode = false;
//         break;
//       default:
//     }
//
//     if (devMode) {
//       await replaceFile(
//           RegExp(r'(const|final|String) +enableDevMode *= *(true|false) *;'),
//               (match) {
//             return "const enableDevMode = true;";
//           }, 'lib/utils/core/env.dart');
//
//       printSuccess('Updated env.dart enableDevMode variable! ✔');
//
//       await SetDeeplinkSchemeCommand.setScheme(config['uni_link_scheme']['test']);
//       await SetAppNameCommand.setAppName(config['display_app_name']['test']);
//       await SetAppIdCommand.setAppId(config['app_id']['android']['test'], config['app_id']['ios']['test']);
//     } else {
//       await replaceFile(
//           RegExp(r'(const|final|String) +enableDevMode *= *(true|false) *;'),
//               (match) {
//             return "const enableDevMode = false;";
//           }, 'lib/utils/core/env.dart');
//
//       printSuccess('Updated env.dart enableDevMode variable! ✔');
//
//       await SetDeeplinkSchemeCommand.setScheme(config['uni_link_scheme']['prod']);
//       await SetAppNameCommand.setAppName(config['display_app_name']['prod']);
//       await SetAppIdCommand.setAppId(config['app_id']['android']['prod'], config['app_id']['ios']['prod']);
//     }
//   }
// }
