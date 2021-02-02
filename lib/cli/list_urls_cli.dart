import 'package:apitest/list_urls.dart';
import 'package:apitest/options/off_off.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class ListUrlsCli extends Command {
  @override
  final name = 'listUrls';

  @override
  final description = 'print and return URLs as an array of strings';

  ListUrlsCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await listUrls();
    exit(0);
  }
}
