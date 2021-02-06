import 'package:theta/theta.dart';
import 'package:args/command_runner.dart';
import 'dart:io';

class ThumbGetCli extends Command {
  @override
  final name = 'thumbGet';

  @override
  final description = 'Save last file thumbnail';

  ThumbGetCli() {
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    await File('thumbnail.jpg')
        .writeAsBytes(await ThetaFile.getLastThumbBytes());
    exit(0);
  }
}
