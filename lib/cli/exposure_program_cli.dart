import 'package:apitest/cli/pretty.dart';
import 'package:args/command_runner.dart';
import 'dart:io';
import 'package:theta/theta.dart';

class ExposureProgramCli extends Command {
  @override
  final name = 'exposureProgram';

  @override
  final description =
      'set exposure program 1 (manual), 2 (auto), 3 (aperture Z1 only), 4 (shutter), 9 (iso)';

  ExposureProgramCli() {
    argParser
      ..addOption('value',
          help:
              '1 (manual), 2 (auto), 3 (aperture Z1 only), 4 (shutter), 9 (iso)',
          allowed: ['1', '2', '3', '4', '9']);
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    if (!argResults.wasParsed('value')) {
      print('Specify program value. Example --value=2 or --value=9');
      printUsage();
      exit(1);
    } else {
      print(pretty(await CameraOption.setExposureProgram(argResults['value'])));
      exit(0);
    }
  }
}
