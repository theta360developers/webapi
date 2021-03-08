import 'package:args/command_runner.dart';
import 'dart:io';
import 'package:theta/theta.dart';

class ShutterVolumeCli extends Command {
  @override
  final name = 'shutterVolume';

  @override
  final description = 'set shutter volume off, low, medium, max';

  ShutterVolumeCli() {
    argParser
      ..addFlag('off', help: 'camera shutter is silent', negatable: false)
      ..addFlag('low',
          help: 'shutter sound is 1/3 of max volume', negatable: false)
      ..addFlag('medium',
          help: 'shutter sound is 2/3 of max volume', negatable: false)
      ..addFlag('max',
          help: 'shutter sound is loudest possible', negatable: false);
  }

  @override
  void run() async {
    if (argResults.wasParsed('off')) {
      await (CameraOption.setOption('_shutterVolume', 0));
      exit(0);
    } else if (argResults.wasParsed('low')) {
      await (CameraOption.setOption('_shutterVolume', 33));
      exit(0);
    } else if (argResults.wasParsed('medium')) {
      await (CameraOption.setOption('_shutterVolume', 66));
      exit(0);
    } else if (argResults.wasParsed('max')) {
      await (CameraOption.setOption('_shutterVolume', 100));
      exit(0);
    } else {
      printUsage();
      print('Example: theta shutterVolume --off');
    }
  }
}
