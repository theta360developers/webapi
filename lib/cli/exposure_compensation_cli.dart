// import 'package:apitest/options/set_exposure_compensation.dart';
import 'package:args/command_runner.dart';
import 'dart:io';
import 'package:theta/theta.dart';

class ExposureCompensationCli extends Command {
  @override
  final name = 'exposureCompensation';

  @override
  final description = 'set exposure compensation with --value=2.0';

  ExposureCompensationCli() {
    argParser
      ..addOption('value',
          help: 'EV exposure compensation. Example --value=-2.0',
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
  }

  @override
  void run() async {
    if (!argResults.wasParsed('value')) {
      print('Specify compensation value. Example --value=-2.0 or --value=0.0');
      printUsage();
      exit(1);
    } else {
      await CameraOption.setOption('exposureCompensation', argResults['value']);
      var response = await CameraOption.getOption('exposureCompensation');
      var exposureCompensationValue =
          response['results']['options']['exposureCompensation'];
      print(
          'The EV is now $exposureCompensationValue. Did it work?  If so, take a moment to celebrate.');
      exit(0);
    }
  }
}
