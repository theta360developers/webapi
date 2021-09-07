import 'package:apitest/commands/start_video.dart';
import 'package:args/command_runner.dart';
import 'dart:io';

class StartVideoCli extends Command {
  @override
  final name = 'startVideo';

  @override
  final description = 'Start video. Must be in video mode';

  StartVideoCli() {
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    await startVideo();
    exit(0);
  }
}
