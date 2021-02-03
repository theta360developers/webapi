import 'package:apitest/cli/pretty.dart';
import 'package:apitest/options/set_exposure_compensation.dart';
import 'package:args/command_runner.dart';
import 'dart:io';
import 'package:dcli/dcli.dart';

class ExposureCompensationCli extends Command {
  @override
  final name = 'exposureCompensation';

  @override
  final description = 'set exposure compensation';

  ExposureCompensationCli() {
    argParser
      ..addOption('value',
          help:
              '-2.0, -1.7, -1.3, -1.0, -0.7, -0.3, 0.0, 0.3, 0.7, 1.0, 1.3, 1.7, 2.0',
          allowed: [
            '-2.0',
            '-1.7',
            '-1.3',
            '-1.0',
            '-0.7',
            '-0.3',
            '0.0',
            '0.3',
            '0.7',
            '1.0',
            '1.3',
            '1.7',
            '2.0'
          ]);
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    if (!argResults.wasParsed('value')) {
      print(red(
          'Specify compensation value. Example --value=-2.0 or --value=0.0'));
      printUsage();
      exit(1);
    } else {
      await setExposureCompensation(double.parse(argResults['value']));
      exit(0);
    }
  }
}
