import 'package:args/command_runner.dart';
import 'package:theta/theta.dart';
import 'dart:io';

class SetMySettingCli extends Command {
  @override
  final name = 'setMySetting';

  @override
  final description = 'Save single setting to My Setting';

  SetMySettingCli() {
    argParser
      ..addOption('name', help: '--name=_filter')
      ..addOption('value', help: '--value=hdr');
  }

  @override
  void run() async {
    if (argResults.arguments.isEmpty) {
      printUsage();
      exit(0);
    } else if (argResults.wasParsed('name') && argResults.wasParsed('value')) {
      var response = await CameraOption.setMySetting(
          argResults['name'], argResults['value']);
      if (response.containsKey('error')) {
        print('\nThere is a problem. Did you set both the name and value?');
        print('Is this option supported in your camera model?');
        print('Check API documentation for valid options');
        print('    https://api.ricoh/docs/theta-web-api-v2.1/');
        print('Example: theta setMySetting --name=_filter --value=hdr\n');
        print(
            'Keep trying.  If you are stuck, post a question in the forum at');
        print('    https://community.theta360.guide\n');
        exit(0);
      }
      print('it looks like the setting was set correctly.  I hope...');
      print(response);
      print('on the SC2 and SC2B there is no way to view the saved settings');
      exit(0);
    }
  }
}
