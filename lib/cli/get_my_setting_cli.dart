import 'package:apitest/cli/pretty.dart';
import 'package:args/command_runner.dart';
import 'package:theta/theta.dart';
import 'dart:io';

class GetMySettingCli extends Command {
  @override
  final name = 'getMySetting';

  @override
  final description = 'Display settings from My Settings';

  GetMySettingCli() {
    // argParser..addOption('name', help: '--name=whiteBalance');
  }

  @override
  void run() async {
    var response = await CameraOption.getMySetting();
    if (response.containsKey('error')) {
      print('\nThere is a problem. You must set My Settings first prior.');
      print('\nIf my setting is blank, you will get an error.');
      print('Keep trying.  If you are stuck, post a question in the forum at');
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
