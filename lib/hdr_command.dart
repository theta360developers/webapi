import 'package:args/command_runner.dart';
import 'package:theta/theta.dart';
import 'dart:io';

class HdrCommand extends Command {
  @override
  final name = 'hdr';

  @override
  final description = 'Enable, save, disable, and check hdr settings';

  @override
  void run() async {
    print(argResults.arguments);
    print(argParser.usage);
    if (argResults.arguments.first == 'set') {
      print('setting hdr');
      // await CameraOption.hdrSet();
      // print(await CameraOption.filterSetting);
      // exit(0);
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
  }
}
