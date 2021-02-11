import 'package:args/command_runner.dart';
import 'package:theta/theta.dart';
import 'dart:io';
import 'pretty.dart';

class StopCaptureCli extends Command {
  @override
  final name = 'stopCapture';

  @override
  final description =
      'stops interval, video, and continuous shooting. returns list of URLs for interval shots';

  StopCaptureCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    print(pretty(await ThetaRun.stopCapture()));
    exit(0);
  }
}
