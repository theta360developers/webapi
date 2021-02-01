import 'package:args/command_runner.dart';
import 'package:theta/theta.dart';
import 'dart:io';
import 'pretty.dart';

class InfoCli extends Command {
  @override
  final name = 'info';

  @override
  final description = 'Camera info: model, serialNumber, apiLevel... ';

  InfoCli() {
    argParser
      ..addFlag('model',
          help: 'return camera model such as RICOH THETA SC2', negatable: false)
      ..addFlag('firmware',
          help: 'Internal camera OS firmware version. Example: 1.60.1',
          negatable: false);
  }

  @override
  void run() async {
    if (argResults.arguments.isEmpty) {
      print(pretty(await Camera.info));
      exit(0);
    } else if (argResults.wasParsed('model')) {
      var model = await Camera.model;
      print('Camera model: $model');
      exit(0);
    } else if (argResults.wasParsed('firmware')) {
      var firmware = await Camera.firmware;
      print('Camera firmware version: $firmware');
      exit(0);
    }
  }
}
