import 'package:apitest/options/set_mode_image.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class SetModeImageCli extends Command {
  @override
  final name = 'setModeImage';

  @override
  final description = 'Set camera to image mode';

  SetModeImageCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await setModeImage();
    exit(0);
  }
}
