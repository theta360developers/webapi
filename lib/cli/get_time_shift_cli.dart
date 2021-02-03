import 'package:apitest/options/get_timeshift.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class GetTimeShiftCli extends Command {
  @override
  final name = 'getTimeShift';

  @override
  final description = 'get Time Shift settings. SC2B, V, Z1 only';

  GetTimeShiftCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await getTimeShift();
    exit(0);
  }
}
