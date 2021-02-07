import 'package:apitest/cli/pretty.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';

import 'package:theta/theta.dart';
// import 'pretty.dart';

class ListUrlsCli extends Command {
  @override
  final name = 'listUrls';

  @override
  final description = 'print and return URLs as an array of strings';

  ListUrlsCli() {
    argParser
      ..addOption('number', help: 'number of urls to list. --number=10')
      ..addFlag('all', help: 'list all file urls', negatable: false);
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    if (argResults.arguments.isEmpty) {
      printUsage();
    } else if (argResults.wasParsed('all')) {
      print(pretty(await ThetaFile.listUrls(await ThetaFile.totalEntries)));
      exit(0);
    } else if (argResults.wasParsed('number')) {
      print(pretty(await ThetaFile.listUrls(int.parse(argResults['number']))));
    } else {
      printUsage();
    }
  }
}
