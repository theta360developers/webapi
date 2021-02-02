import 'package:apitest/options/set_exposure_compensation_two.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class SetExposureCompensationTwoCli extends Command {
  @override
  final name = 'setExposureCompensationTwo';

  @override
  final description = 'Set exposure compensation to 2.0.';

  SetExposureCompensationTwoCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await setExposureCompensationTwo();
    exit(0);
  }
}
