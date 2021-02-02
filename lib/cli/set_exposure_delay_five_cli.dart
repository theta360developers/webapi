import 'package:apitest/options/set_exposure_delay_five.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class SetExposureDelayFiveCli extends Command {
  @override
  final name = 'setExposureDelayFive';

  @override
  final description = 'Set camera self timer';

  SetExposureDelayFiveCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await setExposureDelayFive();
    exit(0);
  }
}
