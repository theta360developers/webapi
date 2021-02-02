import 'package:apitest/take_and_download.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class TakeAndDownloadCli extends Command {
  @override
  final name = 'takeAndDownload';

  @override
  final description =
      'Take picture. Show elapsed time. Download to local disk.';

  TakeAndDownloadCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await takeAndDownload();
    exit(0);
  }
}
