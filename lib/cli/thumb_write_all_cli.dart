import 'package:apitest/thumbnails/write_all_thumbs.dart';
import 'package:args/command_runner.dart';
// import 'package:theta/theta.dart';
import 'dart:io';
// import 'pretty.dart';

class ThumbWriteAllCli extends Command {
  @override
  final name = 'thumbWriteAll';

  @override
  final description = 'Download and save all thumbnails to local storage.';

  ThumbWriteAllCli() {
    //TODO: add verification check to make sure person really wants to delete the files
    // argParser
    //   ..addFlag('battery', help: 'battery charge level', negatable: false);
  }

  @override
  void run() async {
    //TODO: move to library. move print statement outside of library
    await writeAllThumbs();
    exit(0);
  }
}
