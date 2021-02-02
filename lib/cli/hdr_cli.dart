import 'package:args/command_runner.dart';
import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class HdrCli extends Command {
  @override
  final name = 'hdr';

  @override
  final description = 'Enable, save, delete, disable, and show hdr settings';

  HdrCli() {
    argParser
      ..addFlag('enable',
          help:
              'enable/disable HDR until you turn off camera or put it to sleep')
      ..addFlag('save',
          help: 'save/delete filter to mySetting. Survives camera off')
      ..addFlag('show',
          help: 'show current filter settings. does not survive reboot',
          negatable: false)
      ..addFlag('show-saved',
          help: 'show filter saved in mySettings', negatable: false);
  }

  @override
  void run() async {
    if (argResults.arguments.isEmpty) {
      print(argParser.usage);
    } else if (argResults.wasParsed('enable')) {
      if (argResults['enable']) {
        await CameraOption.hdrSet();
        print(await CameraOption.filterSetting);
        exit(0);
      } else {
        //if not enable, must be --no-enable
        await CameraOption.filterOff(); //turn off filter
        print(await CameraOption.filterSetting); //print out filter settings
      }
    } else if (argResults.wasParsed('save')) {
      if (argResults['save']) {
        //save hdr filter
        await CameraOption.hdrSave();
        print(await CameraOption.filterSavedSetting);
        exit(0);
      } else {
        //delete saved filter settings
        await CameraOption.filterSavedOff();
        print(await CameraOption.filterSavedSetting);
        exit(0);
      }
    } else if (argResults.wasParsed('show')) {
      //print current filter setting
      print(await CameraOption.filterSetting);
      exit(0);
    } else if (argResults.wasParsed('show-saved')) {
      print(await CameraOption.filterSavedSetting);
      exit(0);
    } else {
      print(argParser.usage);
    }
  }
}
