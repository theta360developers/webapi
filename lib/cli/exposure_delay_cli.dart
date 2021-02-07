import 'package:apitest/options/set_exposure_delay.dart';
import 'package:args/command_runner.dart';
import 'dart:io';
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
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    if (!argResults.wasParsed('seconds')) {
      print(red(
          'Specify compensation value. Example --seconds=0 or --seconds=10'));
      printUsage();
      exit(1);
    } else {
      await setExposureDelay(int.parse(argResults['seconds']));
      exit(0);
    }
  }
}
