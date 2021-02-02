import 'package:apitest/commands/start_capture.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class StartCaptureCli extends Command {
  @override
  final name = 'startCapture';

  @override
  final description = 'Start bracket capture';

  StartCaptureCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await startCapture();
    exit(0);
  }
}
