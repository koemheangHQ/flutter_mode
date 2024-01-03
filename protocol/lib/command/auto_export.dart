// import 'dart:io';
//
// import 'package:path/path.dart';
//
// class AutoExportCommand extends Command {
//   @override
//   String get description => 'Auto export dart files';
//
//   @override
//   String get name => 'auto-export';
//
//   AutoExportCommand() {
//     argParser.addOption('root-path',
//         defaultsTo: './', abbr: 'p', help: 'Root directory of flutter project');
//   }
//
//   scanFolder(Directory directory, {bool isLib = false}) async {
//     var files = <String>[];
//     for (var fsEntity in (await directory.list().toList())) {
//       if (fsEntity.path.endsWith('.dart')) {
//         if (!isLib) {
//           if (!['_.dart', '.g.dart', '.freezed.dart', '.part.dart']
//               .any((suffix) => fsEntity.path.endsWith(suffix))) {
//             files.add(basename(fsEntity.path));
//           }
//         }
//       } else if (fsEntity is Directory) {
//         await scanFolder(fsEntity);
//         if (File(join(fsEntity.path, '_.dart')).existsSync()) {
//           files.add(join(basename(fsEntity.path), '_.dart'));
//         }
//       }
//     }
//     late File exportFile;
//     if (isLib) {
//       final preImports = [
//         'package:flutter/material.dart',
//         'package:flutter_riverpod/flutter_riverpod.dart',
//         'package:hive_flutter/hive_flutter.dart',
//       ];
//       files.insertAll(0, preImports);
//       exportFile = File(join(directory.path, 'export.dart'));
//     } else {
//       exportFile = File(join(directory.path, '_.dart'));
//     }
//     if (files.isNotEmpty) {
//       await exportFile.writeAsString(
//         '${files.map((e) => "export '$e';").join('\n')}\n',
//         mode: FileMode.write,
//       );
//     }
//   }
//
//   @override
//   void run() async {
//     final rootProject = Directory(argResults?['root-path']);
//     final libFolder = Directory(join(rootProject.path, 'lib'));
//     if (libFolder.existsSync()) {
//       await scanFolder(libFolder, isLib: true);
//     }
//     printSuccess('Export completed!');
//   }
// }
