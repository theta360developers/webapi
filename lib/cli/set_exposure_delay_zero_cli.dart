import 'package:apitest/options/set_exposure_delay_zero.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class SetExposureDelayZeroCli extends Command {
  @override
  final name = 'setExposureDelayZero';

  @override
  final description = 'Turn off camera self timer';

  SetExposureDelayZeroCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await setExposureDelayZero();
    exit(0);
  }
}
