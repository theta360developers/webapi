import 'package:args/command_runner.dart';
import 'dart:io';
import 'package:yaml/yaml.dart';
import '00_pubspec_contents.dart';

class AppCli extends Command {
  @override
  final name = 'app';

  @override
  final description = 'information on this app. --version shows version';

  AppCli() {
    argParser
      ..addFlag('version',
          help: 'version information for this app', negatable: false)
      ..addFlag('description', help: 'app description', negatable: false)
      ..addFlag('repository', help: 'url of GitHub repo', negatable: false)
      ..addFlag('homepage', help: 'blog for this tool', negatable: false);
  }

  @override
  void run() async {
    var conf = loadYaml(pubspecContents);
    if (argResults.arguments.isEmpty) {
      printUsage();
    } else if (argResults.wasParsed('version')) {
      print(conf['version']);
    } else if (argResults.wasParsed('description')) {
      print('\n');
      print(conf['description']);
      print('\n');
    } else if (argResults.wasParsed('repository')) {
      print(conf['repository']);
    } else if (argResults.wasParsed('homepage')) {
      print(conf['homepage']);
    } else {
      printUsage();
    }

    exit(0);
  }
}
