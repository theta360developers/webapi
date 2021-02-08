import 'package:args/command_runner.dart';
import 'dart:io';
import 'package:theta/theta.dart';
// import 'pretty.dart';

class SleepDelayCli extends Command {
  @override
  final name = 'sleepDelay';

  @override
  final description = 'Set or disable camera auto-sleep.';

  SleepDelayCli() {
    argParser
      ..addFlag('off',
          help: 'turn auto-sleep off.  Camera will never sleep',
          negatable: false)
      ..addOption('seconds',
          help: 'auto-sleep in seconds 60 to 65534. --seconds=300 (5 minutes)');
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    if (argResults.arguments.isEmpty) {
      printUsage();
    } else if (argResults.wasParsed('off')) {
      await CameraOption.sleepDelay(65535);
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
        await CameraOption.sleepDelay(int.parse(argResults['seconds']));
        exit(0);
      }
    } else {
      printUsage();
    }
  }
}
