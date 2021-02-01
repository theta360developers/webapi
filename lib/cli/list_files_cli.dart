import 'package:apitest/list_files.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class ListFilesCli extends Command {
  @override
  final name = 'listFiles';

  @override
  final description = 'list all image and video files on camera';

  ListFilesCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await listFiles();
    exit(0);
  }
}
