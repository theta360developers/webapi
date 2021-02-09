import 'package:args/command_runner.dart';
import 'dart:io';
import 'package:theta/theta.dart';
import 'package:dcli/dcli.dart';

class ExposureDelayCli extends Command {
  @override
  final name = 'exposureDelay';

  @override
  final description = 'set self timer delay in seconds';

  ExposureDelayCli() {
    argParser
      ..addOption('seconds',
          help: 'Self-delay in seconds. --seconds=0  - shoot immediately',
          allowed: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10']);
  }

  @override
  void run() async {
    if (!argResults.wasParsed('seconds')) {
      print(red(
          'Specify compensation value. Example --seconds=0 or --seconds=10'));
      printUsage();
      exit(1);
    } else {
      await CameraOption.setOption('exposureDelay', argResults['seconds']);
      exit(0);
    }
  }
}
