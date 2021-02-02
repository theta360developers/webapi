import 'package:apitest/download_file.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class DownloadFileCli extends Command {
  @override
  final name = 'downloadFile';

  @override
  final description = 'Download newest file and save to local computer';

  DownloadFileCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await downloadFile();
    exit(0);
  }
}
