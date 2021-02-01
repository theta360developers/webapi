import 'package:args/command_runner.dart';
import 'package:theta/theta.dart';
import 'dart:io';
import 'pretty.dart';

class TakePictureCli extends Command {
  @override
  final name = 'takePicture';

  @override
  final description = 'take picture, similar to pressing shutter button';

  TakePictureCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    print(pretty(await takePicture()));
    exit(0);
  }
}
