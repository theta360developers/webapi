import 'package:args/command_runner.dart';
import 'package:theta/theta.dart';
import 'dart:io';

class SetOptionCli extends Command {
  @override
  final name = 'setOption';

  @override
  final description =
      'Set single option. --name=_colorTemperature --value=5000';

  SetOptionCli() {
    argParser
      ..addOption('name', help: '--name=captureMode')
      ..addOption('value', help: '--value=image');
  }

  @override
  void run() async {
    if (argResults.arguments.isEmpty) {
      printUsage();
      exit(0);
    } else if (argResults.wasParsed('name') && argResults.wasParsed('value')) {
      var response =
          await CameraOption.setOption(argResults['name'], argResults['value']);
      if (response.containsKey('error')) {
        print('\nThere is a problem. Did you set both the name and value?');
        print('Is this option supported in your camera model?');
        print('Check API documentation for valid options');
        print('    https://api.ricoh/docs/theta-web-api-v2.1/');
        print('Example: theta setOption --name=captureMode --value=image\n');
        print(
            'Keep trying.  If you are stuck, post a question in the forum at');
        print('    https://community.theta360.guide\n');
        exit(0);
      }
      print('it looks like the option was set correctly.  I hope...');
      print(response);
      var currentSetting = await CameraOption.getOption(argResults['name']);
      print(currentSetting['results']['options']);
      exit(0);
    }
  }
}
