import 'package:apitest/cli/pretty.dart';
import 'package:args/command_runner.dart';
import 'package:theta/theta.dart';
import 'dart:io';

class GetMySettingsCli extends Command {
  @override
  final name = 'getMySettings';

  @override
  final description = 'Display single setting from My Settings';

  GetMySettingsCli() {
    argParser..addOption('name', help: '--name=whiteBalance');
  }

  @override
  void run() async {
    if (argResults.arguments.isEmpty) {
      printUsage();
      exit(0);
    } else if (argResults.wasParsed('name')) {
      var response = await CameraOption.getMySetting(argResults['name']);
      if (response.containsKey('error')) {
        print('\nThere is a problem. Perhaps you sent an invalid option?');
        print('Is this option supported in your camera model?');
        print('Check API documentation for valid options');
        print('    https://api.ricoh/docs/theta-web-api-v2.1/');
        print('Example: theta getOption --name=whiteBalance\n');
        print(
            'Keep trying.  If you are stuck, post a question in the forum at');
        print('    https://community.theta360.guide\n');
        exit(0);
      }
      print(pretty(response));
      // var optionMap = response['results']['options'];
      // print(pretty(optionMap));
      // var optionName = optionMap.keys.elementAt(0);
      // print(
      //     'The THETA camera option $optionName is set to ${optionMap[optionName]}');
      exit(0);
    }
  }
}
