import 'package:args/command_runner.dart';
import 'package:theta/theta.dart';
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
    print(await CameraOption.setOption('captureMode', 'image'));
    exit(0);
  }
}
