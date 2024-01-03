// import 'package:args/command_runner.dart';
// import 'package:ff/commands/auto_export.dart';
// import 'package:ff/commands/build.dart';
// import 'package:ff/commands/compile_tool.dart';
// import 'package:ff/commands/set_app_id.dart';
// import 'package:ff/commands/set_app_name.dart';
// import 'package:ff/commands/set_app_version.dart';
// import 'package:ff/commands/set_deeplink_scheme.dart';
// import 'package:ff/commands/set_env.dart';
// import 'package:ff/commands/sign_apk.dart';
// import 'package:ff/commands/translate.dart';
//
// import '../lib/command/auto_export.dart';
// import '../lib/command/build.dart';
// import '../lib/command/compile_tool.dart';
// import '../lib/command/set_app_id.dart';
// import '../lib/command/set_app_name.dart';
// import '../lib/command/set_app_version.dart';
// import '../lib/command/set_deeplink_scheme.dart';
// import '../lib/command/set_env.dart';
// import '../lib/command/sign_apk.dart';
// import '../lib/command/translate.dart';
//
// void main(List<String> arguments) async {
//   try {
//     final runner = CommandRunner('ff', 'Command line for this project')
//       ..addCommand(AutoExportCommand())
//       ..addCommand(CompileToolCommand())
//       ..addCommand(SetAppVersionCommand())
//       ..addCommand(SetAppIdCommand())
//       ..addCommand(SignApkCommand())
//       ..addCommand(TranslateCommand())
//       ..addCommand(SetAppNameCommand())
//       ..addCommand(SetDeeplinkSchemeCommand())
//       ..addCommand(BuildProjectCommand())
//       ..addCommand(SetEnvironmentCommand());
//     await runner.run(arguments);
//   } on UsageException catch (e) {
//     print(e);
//   }
// }
