import 'package:apitest/commands/start_capture.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class StartCaptureCli extends Command {
  @override
  final name = 'startCapture';

  @override
  final description = 'Start capture. Must specifiy capture mode';

  StartCaptureCli() {
    argParser
      ..addOption(
        'mode',
        help: '--mode=... interval, bracket',
        allowed: [
          'interval',
          'composite',
          'bracket',
          'timeShift',
        ],
      );
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    if (!argResults.wasParsed('mode')) {
      print('specify capture mode');
      printUsage();
      exit(1);
    } else {
      await startCapture(argResults['mode']);
      exit(0);
    }
  }
}
