import 'package:args/command_runner.dart';
import 'package:theta/theta.dart';
import 'dart:io';
import 'pretty.dart';

class HdrCli extends Command {
  @override
  final name = 'hdr';

  @override
  final description = 'Enable, save, disable, and check hdr settings';

  HdrCli() {
    argParser
      ..addFlag('enable',
          help: 'enable HDR until you turn off camera or put it to sleep');
  }

  @override
  void run() async {
    print('running hdr');
    if (argResults.arguments.isEmpty) {
      print(argParser.usage);
    } else if (argResults.wasParsed('enable')) {
      //TODO: enable hdr
      print('TODO: enable hdr');
      await CameraOption.hdrSet();
      print(await CameraOption.filterSetting);
      exit(0);
    }
  }
}


    // else {
    //     await CameraOption.filterOff();
    //     print(await CameraOption.filterSetting);
    //     exit(0);
    //   }
    // } else if (parsedArguments.wasParsed('hdr-save')) {
    //   print('saving hdr: ${parsedArguments['hdr-save']}');
    //   // this is a boolean
    //   if (parsedArguments['hdr-save']) {
    //     await CameraOption.hdrSave();
    //     print(await CameraOption.filterSavedSetting);
    //     exit(0);
    //   } else {
    //     await CameraOption.filterSavedOff();
    //     print(await CameraOption.filterSavedSetting);
    //     exit(0);
    //   }
    // } else if (parsedArguments.wasParsed('help')) {
    //   print(parser.usage);
    //   exit(0);
    // } else if (parsedArguments.wasParsed('filter-show')) {
    //   print(await CameraOption.filterSetting);
    //   exit(0);
    // } else if (parsedArguments.wasParsed('filter-save-show')) {
    //   print(await CameraOption.filterSavedSetting);
    //   exit(0);
    // }
