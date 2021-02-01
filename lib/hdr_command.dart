import 'package:args/args.dart';
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
    print('running hdr');
    var hdrParser = ArgParser();

    print(hdrParser.options);
    hdrParser.addOption('enable',
        help: 'enable HDR until camera is put to sleep or turned off');

    print(hdrParser.usage);

    // if (argResults.arguments.isNotEmpty) {
    //   manageHdr(argResults.arguments.first);
    // } else {
    //   print(argParser.usage);
    // }

    // await CameraOption.hdrSet();
    // print(await CameraOption.filterSetting);
    // exit(0);
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
