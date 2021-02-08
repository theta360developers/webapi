import 'package:args/command_runner.dart';
import 'dart:io';
import 'package:theta/theta.dart';

class OffDelayCli extends Command {
  @override
  final name = 'offDelay';

  @override
  final description = 'Set or disable camera auto power off.';

  OffDelayCli() {
    argParser
      ..addFlag('off',
          help: 'disable auto-power off.  Camera will never power off',
          negatable: false)
      ..addOption('seconds',
          help:
              'auto-sleep in seconds 60 to 65534. --seconds=600 (10 minutes)');
  }

  @override
  void run() async {
    if (argResults.arguments.isEmpty) {
      printUsage();
    } else if (argResults.wasParsed('off')) {
      await CameraOption.offDelay(65535);
      exit(0);
    } else if (argResults.wasParsed('seconds')) {
      var seconds = int.tryParse(argResults['seconds']) ?? -1;

      if (seconds == -1) {
        print('requires a number between 60 and 65535');
        exit(1);
      } else if (seconds < 60 || seconds > 65535) {
        print('requires a number between 60 and 65535');
        exit(1);
      } else {
        await CameraOption.offDelay(int.parse(argResults['seconds']));
        exit(0);
      }
    } else {
      printUsage();
    }
  }
}
