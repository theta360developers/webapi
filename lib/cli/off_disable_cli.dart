import 'package:apitest/options/off_off.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class OffDisableCli extends Command {
  @override
  final name = 'offDisable';

  @override
  final description = 'Disable power off';

  OffDisableCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await offOff();
    exit(0);
  }
}
