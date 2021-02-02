import 'package:apitest/options/sleep_disable.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class SleepDisableCli extends Command {
  @override
  final name = 'sleepDisable';

  @override
  final description = 'Disable camera auto-sleep.';

  SleepDisableCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await sleepDisable();
    exit(0);
  }
}
