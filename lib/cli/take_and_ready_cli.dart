import 'package:apitest/take_and_ready.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class TakeAndReadyCli extends Command {
  @override
  final name = 'takeAndReady';

  @override
  final description =
      'Take picture. Show elapsed time. Show file URI when ready for download';

  TakeAndReadyCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await downloadReady();
    exit(0);
  }
}
