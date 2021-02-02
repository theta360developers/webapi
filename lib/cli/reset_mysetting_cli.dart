import 'package:apitest/options/reset_my_setting.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class ResetMySettingCli extends Command {
  @override
  final name = 'resetMySetting';

  @override
  final description = 'Reset mySettings (saved settings) to factory default';

  ResetMySettingCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await resetMySetting();
    exit(0);
  }
}
