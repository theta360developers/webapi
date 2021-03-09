import 'package:apitest/cli/pretty.dart';
import 'package:args/command_runner.dart';
import 'package:theta/theta.dart';
import 'dart:io';

class GetMySettingCli extends Command {
  @override
  final name = 'getMySetting';

  @override
  final description =
      'Display settings from My Settings on V, Z1, SC2, SCB. Will not work SC, or S';

  GetMySettingCli() {
    // argParser
    //   ..addFlag('video', help: 'get video saved settings', negatable: false);
  }

  @override
  void run() async {
    var response = await CameraOption.getMySetting();
    if (response.containsKey('error')) {
      print('\nThere is a problem. You must set My Settings first.');
      print('\nIf my setting is blank, you will get an error.');
      print('Keep trying.  If you are stuck, post a question in the forum at');
      print('    https://community.theta360.guide\n');
      exit(1);
    }
    print(pretty(response));
    // var optionMap = response['results']['options'];
    // print(pretty(optionMap));
    // var optionName = optionMap.keys.elementAt(0);
    // print(
    //     'The THETA camera option $optionName is set to ${optionMap[optionName]}');
    print('----------------------------------------------');
    // video does not appear to be working
    // print('VIDEO SETTINGS BELOW');
    // var responseVideo = await CameraOption.getMySettingVideo();
    // print(pretty(responseVideo));
    exit(0);
  }
}
