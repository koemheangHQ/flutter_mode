// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
//
// Future replaceFile(
//     Pattern pattern, String Function(Match) replace, String filePath) async {
//   final file = File(filePath);
//   var fileContent = await file.readAsString();
//   fileContent = fileContent.replaceAllMapped(pattern, replace);
//   await file.writeAsString(fileContent);
// }
//
// Future runScript(String script, String description) async {
//   String scriptContent = '''
// #!/bin/bash
// $script
// ''';
//
//   // Get the system's temporary directory
//   Directory tempDir = Directory.systemTemp;
//
//   // Create a new temporary file in the temporary directory
//   File tempFile =
//       await File('${tempDir.path}/temp_dart_tool_script.sh').create();
//
//   // Write the script to the temporary file
//   await tempFile.writeAsString(scriptContent);
//
//   // Make the temporary file executable
//   await Process.run('chmod', ['+x', tempFile.path]);
//
//   // Run the script
//   Process process = await Process.start(tempFile.path, [], runInShell: true);
//
//   // Stream stdout to console
//   process.stdout.transform(utf8.decoder).listen((data) {
//     print(data);
//   });
//
//   // Stream stderr to console
//   process.stderr.transform(utf8.decoder).listen((data) {
//     printError(data);
//   });
//
//   // Wait for the process to exit
//   int exitCode = await process.exitCode;
//   if (exitCode == 0) {
//     printSuccess("Done $description! ✔");
//   } else {
//     printError('$description returns exit code $exitCode ✘');
//   }
//
//   // Delete the temporary file
//   if (tempFile.existsSync()) {
//     tempFile.deleteSync(recursive: true);
//   }
// }
//
// void printInfo(dynamic message) {
//   print(chalk.blueBright(message.toString()));
// }
//
// void printSuccess(dynamic message) {
//   print(chalk.green(message.toString()));
// }
//
// void printError(dynamic message) {
//   print(chalk.red(message.toString()));
// }
//
// void printWarning(dynamic message) {
//   print(chalk.yellow(message.toString()));
// }
//
// Future<dynamic> getConfig() async {
//   final configFile = File('ff.yaml');
//   if (!configFile.existsSync()) {
//     printError('ff.yaml is not found in the root Flutter project');
//     exit(1);
//   }
//   var doc = loadYaml(configFile.readAsStringSync());
//   return doc;
// }
//
// Future<String> getFlutterRunnable() async {
//   final config = await getConfig();
//   if (config['build_settings']['flutter_sdk_path'] != null) {
//     return config['build_settings']['flutter_sdk_path'];
//   } else {
//     return 'flutter';
//   }
// }
