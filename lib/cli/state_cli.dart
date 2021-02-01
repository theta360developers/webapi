import 'package:args/command_runner.dart';
import 'package:theta/theta.dart';
import 'dart:io';
import 'pretty.dart';

class StateCli extends Command {
  @override
  final name = 'state';

  @override
  final description = 'Camera state: batteryLevel, storageUri...';

  StateCli() {
    argParser
      ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    if (argResults.arguments.isEmpty) {
      print(pretty(await Camera.state));
      exit(0);
    } else if (argResults.wasParsed('battery')) {
      var battery = await Camera.batteryLevel;
      print('Camera battery level: $battery');
      exit(0);
    }
  }
}
